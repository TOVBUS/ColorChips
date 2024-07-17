//
//  OnboardingWelcomView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingWelcomView: View {
    var body: some View {
        VStack(alignment: .center, content: {
            OnboardingGaugeView(progress: 1)
                .padding(.bottom, 44)
            Text("반가워요 핑! \n 저는 운동 교관 피오에요 핑! \n 운동 습관을 잡아줄게요 핑!")
                .multilineTextAlignment(.center)
                .appFont(.title2)
            Image("peoLogo")
            Text("네!").appButton(style: .primary, action: {
                // 다음 온보딩 화면으로 이동
            })
            .padding(.horizontal, 24)
        })
    }
}

#Preview {
    OnboardingWelcomView()
}
