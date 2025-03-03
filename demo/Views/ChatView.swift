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
        NavigationStack {
            if storeViewModel.purchasedSubscriptions.isEmpty {
                SubscriptionView()
            }
            else {
                ScrollView {
                    ActiveUserView()
                    
                    List {
                        ForEach(MockData.users.dropFirst(), id: \.id) { user in
                            InboxRowView(user: user)
                        }
                    }

                    .listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
                }
                .cornerLogo()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            print("Show new message view")
                        } label: {
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.black, Color(.systemGray6))
                        }
                    }
                }
            }
        }
        .padding()
        .environmentObject(storeViewModel)
    }
}

#Preview {
    ChatView()
}
