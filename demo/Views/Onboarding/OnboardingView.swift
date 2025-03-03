//
//  OnboardingView.swift
//  demo
//
//  Created by Antoinette Marie Torres on 3/2/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isOnboardingActive: Bool
        
    var body: some View {
        VStack {
            TabView {
                OnboardOneView()
                OnboardTwoView()
            }
            Button {
                isOnboardingActive.toggle()
            } label: {
                Text("Get Started")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8.0)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
            .interactiveDismissDisabled()
            .tabViewStyle(.page)
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .blue
                UIPageControl.appearance().pageIndicatorTintColor = .gray
            }

    }
}

#Preview {
    OnboardingView(isOnboardingActive: .constant(true))
}
