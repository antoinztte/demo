//
//  SettingsView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import StoreKit
import SwiftUI

struct SettingsView: View {
    
    let user: UserModel
    // Create boolean to control presentation
    @State private var isPresentedManageSubscription = false

    var body: some View {
        
        NavigationStack {
            List {
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
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(user: MockData.users[0])
}
