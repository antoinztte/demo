//
//  StoreViewModel.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import Foundation
import StoreKit

// StoreViewModel is essentially a manager that
    // (1) Fetches subscription products
    // (2) Handles purchases and updates the user's subscription status
    // (3) Manages transactions, including pending purchases and verification
// Designed using StoreKit 2 API

// It is important to get auto-renewable subscription info on-device, regarding current subscriber status and upcoming renewal period
typealias RenewalState = StoreKit.Product.SubscriptionInfo.RenewalState

class StoreViewModel: ObservableObject {
    
    // Two properties use the new Product API
    // @Published allows automatic update of UI when values change
    
    // List of available subscription products from StoreKit
    @Published private(set) var subscriptions: [Product] = []
    // Stores subscriptions the user has already bought
    @Published private(set) var purchasedSubscriptions: [Product] = []
    // Tracks current renewal status of a user's subscription
    @Published private(set) var subscriptionGroupStatus: RenewalState?
    
    // When requesting products, instead of searching in App Store, will search in config file
    // StoreKit requires product IDs that match those in App Store Connect, but our data is local to StoreKit testing
    private let productIds: [String] = ["subscription.yearly", "subscription.monthly"]
    
    // Background task that listens for subscription transactions
    // Keeps purchases updated w/o user intervention
    var updateListenerTask: Task<Void, Error>? = nil
    
    // Once class is loaded, request products
    init() {
        
        // As soon as app opens, listen for transactions (pending payments, approval requests)
        updateListenerTask = listenForTransactions()
        
        Task {
            // Requests available subscriptions when the app launches
            await requestSubscription()
            // Updates user's purchased status in case they already own a subscription
            await updateCustomerProductStatus()
        }
    }
    
    // For when user closes the app, background listener stops listening
    deinit {
        updateListenerTask?.cancel()
    }
    
    // Scenarios where transactions are pending or awaiting approval (child requesting to purchase something) so we need an EventListener
    // StoreKit automatically retries failed subscriptions, so listening for transactions ensures users receive tehir subscriptions as soon as they are approved
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            // Listens for new transactions (successful purchases, renewals)
            for await result in Transaction.updates {
                do {
                    // Ensures the transaction is legitimate
                    let transaction = try self.checkVerified(result)
                    // Updates the list of purchased subscriptions
                    await self.updateCustomerProductStatus()
                    // Marks transaction as finished so StoreKit knows its handled
                    await transaction.finish()
                } catch {
                    print("Transaction failed verification: \(error)")
                }
            }
        }
    }
    
    // @MainActor ensures UI-related updates happen on the main thread
    @MainActor
    func requestSubscription() async {
        do {
            // Fetches subscription products from StoreKit
            subscriptions = try await Product.products(for: productIds)
            print(subscriptions)
        } catch {
            print("Failed product request from App Store server: \(error)")
        }
    }
    
    func purchaseSubscription(_ product: Product) async throws -> Transaction? {
        // Initiates the purchase process
        let result = try await product.purchase()
        
        // Handles different purchase outcomes
        switch result {
        case .success(let verification):
            // Ensures the purchase is legitimate
            let transaction = try checkVerified(verification)
            // Updates the user's subscription status
            await updateCustomerProductStatus()
            // Always finish a transaction (best practice)
            await transaction.finish()
            
            return transaction
            
        case .userCancelled, .pending:
            return nil
            
        default:
            return nil
        }
    }
    
    // Validates authenticity of transaction after successful purchase, or restore transaction
    // Prevents fraud
    // The VerificationResult<T> object contains a JWS-signed transaction, meaning StoreKit2 automatically signs all transactions and checks that they're tamper-proof
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
    
    // If a user restores purchases or renews a subscription, this function ensures that UI reflects their active entitlements 
    @MainActor
    func updateCustomerProductStatus() async {
        // Fetches user's active subscriptions
        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                
                switch transaction.productType {
                    // Checks if product is a subscription
                case .autoRenewable:
                    if let subscription = subscriptions.first(where: { $0.id == transaction.productID }) {
                        purchasedSubscriptions.append(subscription)
                    }
                default:
                    break
                }
                await transaction.finish()
            } catch {
                print("Failed updating products: \(error)")
            }
        }
    }
}

public enum StoreError: Error {
    case failedVerification
}
