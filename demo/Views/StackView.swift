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
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(viewModel.cards) { friend in
                        HomeView(viewModel: viewModel, model: friend)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("CU Here")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#Preview {
    StackView()
}
