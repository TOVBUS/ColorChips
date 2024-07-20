//
//  OnboardingLoadingView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct OnboardingLoadingView: View {
    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 9)

            Text("🧐")
                .font(.customFont(size: 200, weight: .bold))
            Text("분석중...")
                .font(.customFont(size: 20, weight: .bold))
        }
    }
}

#Preview {
    OnboardingLoadingView()
}
