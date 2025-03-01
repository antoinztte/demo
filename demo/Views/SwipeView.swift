//
//  SwipeView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct SwipeView: View {
    
    @Binding var xOffset: CGFloat

    var body: some View {

        HStack {
            Spacer()
            Image(systemName: "hand.thumbsup.circle.fill")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .opacity(Double(xOffset / Constants.screenCutoff))
            Spacer()
            Image(systemName: "hand.thumbsdown.circle.fill")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .opacity(Double(xOffset / Constants.screenCutoff) * -1)
            Spacer()
        }
        .padding(40)

    }
}

#Preview {
    SwipeView(xOffset: .constant(20))
}
