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
            ZStack(alignment: .top) {
                VStack {
                    if storeViewModel.purchasedSubscriptions.isEmpty {
                        SubscriptionView()
                    } else {
                        ActiveUserView()

                        List {
                            ForEach(MockData.users.dropFirst(), id: \.id) { user in
                                InboxRowView(user: user)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                    }
                }
                .padding(.top, 16)
                .background(Color.white.ignoresSafeArea())

                cornerLogo()
            }
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
        .padding()
        .environmentObject(storeViewModel)
    }
}

#Preview {
    ChatView()
}

