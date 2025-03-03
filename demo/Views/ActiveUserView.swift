//
//  ActiveUserView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/2/25.
//

import SwiftUI

struct ActiveUserView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32.0) {
                ForEach(MockData.users.dropFirst(), id: \.id) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image(user.profileImageURL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64.0, height: 64.0)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                )

                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18.0, height: 18.0)
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 12.0, height: 12.0)
                            }
                        }
                        Text(user.firstName())
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106.0)
    }
}

extension UserModel {
    func firstName() -> String {
        String(fullName.split(separator: " ").first ?? "")
    }
}

#Preview {
    ActiveUserView()
}
