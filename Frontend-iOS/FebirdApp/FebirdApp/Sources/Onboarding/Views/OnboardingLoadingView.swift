//
//  OnboardingLoadingView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct OnboardingLoadingView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var viewModel: AzureInbodyViewModel

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 6)

            Text("🧐")
                .font(.customFont(size: 200, weight: .bold))

            Text("분석중...")
                .font(.customFont(size: 20, weight: .bold))
        }
        .onReceive(viewModel.$isLoading) { isLoading in
            if !isLoading {
                print("-------------로딩 완료----------------")
                navigationPathFinder.addPath(option: .inbodyFixView)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingLoadingView()
}
