//
//  ContentView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct Content: View {
    
    // Create variable
    @State var selectedTab = 0
    
    var body: some View {
        
        // Set binding
        TabView(selection: $selectedTab) {
//            HomeView(model: )
//            .tabItem {
//                Image(systemName: "house.fill")
//                    .foregroundColor(Color.white)
//            }
//            .tag(0)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                        .foregroundColor(Color.white)
                }
                .tag(1)
        }
        .tint(.primary)
    }
}

#Preview {
    Content()
}
