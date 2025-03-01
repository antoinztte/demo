//
//  ProfileView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import StoreKit
import SwiftUI

struct ProfileView: View {

    // Create boolean to control presentation
    @State private var isPresentedManageSubscription = false

    var body: some View {

        Button("Manage Subscriptions") {
            isPresentedManageSubscription = true
        }
        .buttonStyle(.automatic)
        // Bind to the modifier and present the sheet
        .manageSubscriptionsSheet(isPresented: $isPresentedManageSubscription)

    }
}

#Preview {
    ProfileView()
}
