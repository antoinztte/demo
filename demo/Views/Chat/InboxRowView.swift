//
//  InboxRowView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/2/25.
//

import SwiftUI

struct InboxRowView: View {
    
    let user: UserModel

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(user.profileImageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(user.fullName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Start your first chat!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72.0)
    }
}

#Preview {
    InboxRowView(user: MockData.users[0])
}
