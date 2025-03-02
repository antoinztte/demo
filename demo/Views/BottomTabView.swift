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
            
            ChatView()
                .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                .tag(1)
            
            ProfileView(user: MockData.users[0])
                .tabItem { Image(systemName: "person.crop.circle.fill") }
                .tag(2)
        }
        .tint(Color(red: 52/255, green: 78/255, blue: 65/255))
    }
}

#Preview {
    BottomTabView()
}
