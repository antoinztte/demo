//
//  StoreViewModel.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import Foundation
import StoreKit

// It is important to get auto-renewable subscription info on-device, regarding current subscriber status and upcoming renewal period
typealias RenewalState = StoreKit.Product.SubscriptionInfo.RenewalState

class StoreViewModel: ObservableObject {
    
    // Two properties use the new Product API
    @Published private(set) var subscriptions: [Product] = []
    @Published private(set) var purchasedSubscriptions: [Product] = []
    @Published private(set) var subscriptionGroupStatus: RenewalState?
    
    // When requesting products, instead of searching in App Store, will search in config file
    private let productIds: [String] = ["subscription.yearly", "subscription.monthly"]
    
    var updateListenerTask: Task<Void, Error>? = nil
    
    // Once class is loaded, request products
    init() {
        
        updateListenerTask = listenForTransactions()
        
        Task {
            await requestSubscription()
            
            await updateCustomerProductStatus()
        }
    }
    
    deinit {
        updateListenerTask?.cancel()
    }
    
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    
                    await self.updateCustomerProductStatus()
                    
                    await transaction.finish()
                } catch {
                    print("Transaction failed verification: \(error)")
                }
            }
        }
    }
    
    @MainActor
    func requestSubscription() async {
        do {
            subscriptions = try await Product.products(for: productIds)
            print(subscriptions)
        } catch {
            print("Failed product request from App Store server: \(error)")
        }
    }
    
    func purchaseSubscription(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        
        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            
            await updateCustomerProductStatus()
            
            await transaction.finish()
            
            return transaction
            
        case .userCancelled, .pending:
            return nil
            
        default:
            return nil
        }
    }
    
    // Validates authenticity of transaction after successful purchase, or restore transaction
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
    
    @MainActor
    func updateCustomerProductStatus() async {
        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                
                switch transaction.productType {
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
