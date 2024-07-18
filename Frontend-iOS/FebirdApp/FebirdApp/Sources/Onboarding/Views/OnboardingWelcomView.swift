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
                .font(.customFont(language: .korean, size: 20, weight: .bold))
            Image("peoLogo")
            Spacer()
            Button("네!") {

            }
            .frame(maxWidth: .infinity, maxHeight: 56)
            .foregroundStyle(Color(.white))
            .font(.customFont(language: .korean, size: 16, weight: .semibold))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
            )
            .padding(.horizontal, 24)
        })
    }
}

#Preview {
    OnboardingWelcomView()
}
