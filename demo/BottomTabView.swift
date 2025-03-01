//
//  ContentView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct BottomTabView: View {
    
    var body: some View {
        
        // Set binding
        TabView {
            StackView()
                .tabItem { Image(systemName: "house.fill") }
                .tag(0)
            
            ProfileView(user: MockData.users[0])
                .tabItem { Image(systemName: "person.crop.circle.fill") }
                .tag(1)
        }
        .tint(.primary)
    }
}

#Preview {
    BottomTabView()
}
