//
//  LogoView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/1/25.
//

import SwiftUI

extension View {
    func cornerLogo() -> some View {
        self.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(.cub)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 30)
                    .padding([.leading, .bottom], -15)
            }
        }
    }
}
