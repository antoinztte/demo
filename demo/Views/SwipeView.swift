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
            Text("Sending friend request!")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .opacity(Double(xOffset / Constants.screenCutoff))
            Spacer()
        }
        .padding(40)

    }
}

#Preview {
    SwipeView(xOffset: .constant(20))
}
