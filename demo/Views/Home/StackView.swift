//
//  StackView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct StackView: View {
    
    @StateObject var viewModel = CardViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
                ZStack {
                    ForEach(viewModel.cards) { friend in
                        HomeView(viewModel: viewModel, model: friend)
                    }
                }
                if !viewModel.cards.isEmpty {
                    SwipeButtonsView(viewModel: viewModel)
                }
            }
            .shadow(color: Color(.gray).opacity(0.2), radius: 5, x: 0, y: 15)
            .cornerLogo()
        }
    }
}

#Preview {
    StackView()
}
