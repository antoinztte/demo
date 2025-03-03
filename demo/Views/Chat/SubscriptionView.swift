//
//  SubscriptionView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import SwiftUI
import StoreKit

struct SubscriptionView: View {
    
    @EnvironmentObject var storeViewModel: StoreViewModel
    @State var isPurchased = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Section("Upgrade to Premium") {
                    ForEach(storeViewModel.subscriptions) { product in
                        Button(action: {
                            Task {
                                await buy(product: product)
                            }
                        }) {
                            VStack {
                                HStack {
                                    Text(product.displayPrice)
                                    Text(product.displayName)
                                }
                                Text(product.description)
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 84/255, green: 92/255, blue: 108/255))
                        .cornerRadius(15.0)
                    }
                }
            }
            .shadow(color: Color(.gray).opacity(0.2), radius: 5, x: 0, y: 15)
        }
    }
    
    // Handles purchase process when a user selects a subscription
    func buy(product: Product) async {
        do {
            // Calls purchaseSubscription function in StoreViewModel
            if try await storeViewModel.purchaseSubscription(product) != nil {
                // If purchase is successful, update state
                isPurchased = true
            }
        } catch {
            print("Purchase failed: \(error.localizedDescription) ")
        }
    }
}

// Injects a test instance of StoreViewModel so view can fetch sample data
#Preview {
    SubscriptionView().environmentObject(StoreViewModel())
}
