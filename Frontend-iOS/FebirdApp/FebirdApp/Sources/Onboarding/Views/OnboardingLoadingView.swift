//
//  OnboardingLoadingView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct OnboardingLoadingView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    
    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 9)
            Text("🧐")
                .font(.customFont(size: 200, weight: .bold))
            Text("분석중...")
                .font(.customFont(size: 20, weight: .bold))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                navigationPathFinder.addPath(option: .inbodyFixView)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingLoadingView()
}
