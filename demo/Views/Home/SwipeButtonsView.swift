//
//  SwipeButtonsView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import SwiftUI

struct SwipeButtonsView: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        HStack(spacing: 32.0) {
            Button {
                viewModel.buttonSwipeAction = .pass
            } label : {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 48.0, height: 48.0)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48.0, height: 48.0)
            Button {
                viewModel.buttonSwipeAction = .befriend
            } label : {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 48.0, height: 48.0)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48.0, height: 48.0)
        }
    }
}

#Preview {
    SwipeButtonsView(viewModel: CardViewModel(service: CardService()))
}
