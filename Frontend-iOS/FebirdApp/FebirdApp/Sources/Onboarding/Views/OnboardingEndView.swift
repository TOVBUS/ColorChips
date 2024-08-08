//
//  OnboardingEndView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct OnboardingEndView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>

    var body: some View {
        OnboardingGaugeView(progress: 8)
            .padding(.top, 26)

        Text("모두 완료하셨군요!\n 이제부터 운동을 시작해볼까요?🔥")
            .multilineTextAlignment(.center)
            .font(.customFont(size: 20, weight: .bold))
            .padding(.top, 30)

        Image("feoTA")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)

        Spacer()

        Button(action: {
            navigationPathFinder.isFirstEnteredApp = false
            navigationPathFinder.popToRoot()
        }, label: {
            Text("메인으로 이동하기")
                .frame(maxWidth: .infinity, maxHeight: 56)
                .foregroundStyle(Color(.white))
                .font(.customFont(size: 16, weight: .semibold))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                )
        })
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingEndView()
}
