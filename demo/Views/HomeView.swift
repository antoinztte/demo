//
//  HomeView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    let model: CardModel

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURL)
                    .resizable()
                    .scaledToFill()
                
//                SwipeView(xOffset: $xOffset)
            }
            
            UserInfoView(user: user)
                .padding(.horizontal)
                .padding(.horizontal)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            swipeAction(action)
        })
        .frame(width: Constants.cardWidth, height: Constants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension HomeView {
    var user: UserModel {
        return model.user
    }
}

private extension HomeView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeAction(_ action: SwipeModel?) {
        guard let action else { return }
        
        let top = viewModel.cards.last
        
        if top == model {
            switch action {
            case .pass :
                swipeLeft()
            case .befriend :
                swipeRight()
            }
        }
    }
}

private extension HomeView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(Constants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= Constants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    HomeView(
        viewModel: CardViewModel(
            service: CardService()
        ),
        model: CardModel(
            user: MockData.users[0]
        )
    )
}
