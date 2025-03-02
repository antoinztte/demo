//
//  ChatView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var storeViewModel = StoreViewModel()

    public var body: some View {
        VStack {
            if storeViewModel.purchasedSubscriptions.isEmpty {
                SubscriptionView()
            }
            else {
                Text("Premium Content")
            }
        }
        .padding()
        .environmentObject(storeViewModel)
    }
}

#Preview {
    ChatView()
}
