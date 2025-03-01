//
//  UserInfoView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Antoinette")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("20")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            Text("Junior | Computer Science Major")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView()
}
