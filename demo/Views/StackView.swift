//
//  StackView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct StackView: View {
    
    @State var viewModel = CardViewModel(service: CardService())
    
    var body: some View {
        VStack(spacing: 20.0) {
                ZStack {
                    ForEach(viewModel.cards) { friend in
                        HomeView(viewModel: viewModel, model: friend)
                }
            }
                .shadow(color: Color(.gray).opacity(0.2), radius: 5, x: 0, y: 15)
            SwipeButtonsView(viewModel: viewModel)
        }
    }
}

#Preview {
    StackView()
}
