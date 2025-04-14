//
//  OnboardingLoadingView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct OnboardingLoadingView: View {
    @EnvironmentObject var onboardingNavigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var profileNavigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var viewModel: AzureInbodyViewModel

    var body: some View {
<<<<<<< HEAD
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                if onboardingNavigationPathFinder.isFirstEnteredApp {
                    OnboardingGaugeView(progress: 6)
                }
                Text("🧐")
                    .font(.customFont(size: 200, weight: .bold))
=======
        VStack {
            if !navigationPathFinder.isFirstEnteredApp {
                OnboardingGaugeView(progress: 6)
            }
>>>>>>> 6d4c919 (🐛 :: 뭔가 고친 것 같은데 기억 나지 않음 ...)

                Text("분석중...")
                    .font(.customFont(size: 20, weight: .bold))
            }
        }
        .onReceive(viewModel.$isLoading) { isLoading in
            if !isLoading {
                print("-------------로딩 완료----------------")
                if onboardingNavigationPathFinder.isFirstEnteredApp {
                    onboardingNavigationPathFinder.addPath(option: .inbodyFixView)
                }
                else if !profileNavigationPathFinder.isFirstEnteredApp {
                    profileNavigationPathFinder.addPath(option: .inbodyFixView)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.vertical, 60)
    }
}

#Preview {
    OnboardingLoadingView()
}
