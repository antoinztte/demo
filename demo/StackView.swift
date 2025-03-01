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
        ZStack() {
            ForEach(viewModel.cards) { friend in
                HomeView(viewModel: viewModel, model: friend)
            }
        }
    }
}

#Preview {
    StackView()
}
