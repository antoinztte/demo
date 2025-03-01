//
//  HomeView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(.antoinette)
                    .resizable()
                    .scaledToFill()
                
                SwipeView(xOffset: $xOffset)
            }
            
            UserInfoView()
                .padding(.horizontal)
                .padding(.horizontal)
        }
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
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(Constants.screenCutoff) {
            xOffset = 0
            degrees = 0
        }
        else {
            
        }
        
    }
}

#Preview {
    HomeView()
}
