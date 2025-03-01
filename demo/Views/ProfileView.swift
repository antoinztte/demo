//
//  ProfileView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import StoreKit
import SwiftUI

struct ProfileView: View {
    
    let user: UserModel
    // Create boolean to control presentation
    @State private var isPresentedManageSubscription = false

    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            Image(user.profileImageURL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .background {
                                    Circle()
                                        .fill(Color(.systemGray6))
                                        .frame(width: 104, height: 104)
                                        .shadow(radius: 2)
                                }
                            Text("\(user.fullName), \(user.age)")
                        }
                        Spacer()
                    }
                }
                Section("Account Settings") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullName)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(user.email)
                    }
                }
                Section("Legal") {
                    HStack {
                        Text("Terms of Service")
                    }
                    HStack {
                        Button("Manage Subscriptions") {
                            isPresentedManageSubscription = true
                        }
                        .buttonStyle(.automatic)
                        // Bind to the modifier and present the sheet
                        .manageSubscriptionsSheet(isPresented: $isPresentedManageSubscription)
                    }
                }
                Section {
                    Button("Logout") {
                    }
                    .foregroundStyle(.red)
                }
                Section {
                    Button("Delete Account") {
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    ProfileView(user: MockData.users[0])
}
