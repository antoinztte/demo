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
            VStack {
                ZStack {
                    ForEach(viewModel.cards) { friend in
                        HomeView(viewModel: viewModel, model: friend)
                }
            }
                .shadow(color: Color(.gray).opacity(0.5), radius: 10, x: 0, y: 15)
        }
    }
}

#Preview {
    StackView()
}
