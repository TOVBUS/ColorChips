//
//  OnboardingWelcomView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingWelcomView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 1)
            //.padding(.bottom, 44)
            
            VStack(alignment: .center, content: {
                Text("반가워요 핑! \n 저는 운동 교관 피오에요 핑! \n 운동 습관을 잡아줄게요 핑!")
                    .multilineTextAlignment(.center)
                    .font(.customFont(size: 20, weight: .bold))

                Image("peoLogo")

                Spacer()

                CustomButtonView(title: "네!") {
                    navigationPathFinder.addPath(option: .onboardingSelectUserInfo)
                }
            })
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    OnboardingWelcomView()
}
