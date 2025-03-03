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
                        .background(Color(red: 52/255, green: 78/255, blue: 65/255))
                        .cornerRadius(15.0)
                    }
                }
            }
            .shadow(color: Color(.gray).opacity(0.2), radius: 5, x: 0, y: 15)
        }
    }
    
    func buy(product: Product) async {
        do {
            if try await storeViewModel.purchaseSubscription(product) != nil {
                isPurchased = true
            }
        } catch {
            print("Purchase failed: \(error.localizedDescription) ")
        }
    }
}

#Preview {
    SubscriptionView().environmentObject(StoreViewModel())
}
