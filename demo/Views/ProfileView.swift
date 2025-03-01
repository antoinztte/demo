//
//  ProfileView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State var offset: CGFloat = 0
    
    let user: UserModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 15) {
                
                GeometryReader { proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return AnyView(
                        ZStack {
                            Image("banner")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screenSize().width, height: minY > 0 ? 180 + minY : 180)
                                .clipped()
                        }
                        .frame(height: minY > 0 ? 180 + minY : 180)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                VStack {
                        Spacer()
                        Image("antoinette")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(y: offset < 0 ? getOffset() - 20 : -20)
                            .scaleEffect(getScale())
                        Spacer()
                }
                .padding(.top, -40)
                .zIndex(-offset > 80 ? 0 : 1)
            }
        })
        .ignoresSafeArea(.all, edges: .top)
    }

    func getOffset() -> CGFloat {
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1.0)
        return scale < 1 ? scale : 1
    }
    
    // Screen size helper
    func screenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}

#Preview {
    ProfileView(user: MockData.users[0])
}

