//
//  FebirdAppApp.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/4/24.
//

import SwiftUI

@main
struct FebirdAppApp: App {
    @StateObject private var tabViewModel = TabViewModel()
    @StateObject private var navigationPathFinder = NavigationPathFinder<OnboardingViewOptions>()
    private var isFirstEnteredApp = true

    var body: some Scene {
        WindowGroup {
            // MARK: - 최초 진입시 온보딩뷰
            NavigationStack(path: $navigationPathFinder.path) {
                if isFirstEnteredApp {
                    OnboardingWelcomView()
                        .navigationDestination(for: OnboardingViewOptions.self) { option in
                            option.view()
                        }
                } else {
                    // MARK: - 그렇지 않으면 운동메인뷰
                    // 커스텀 탭바로 선택한 운동메인뷰를 표시
                    ZStack(alignment: .bottom) {
                        TabView(selection: $tabViewModel.selectedTab) {
                            MealMainView()
                                .tag(TabSelection(rawValue: 0))
                            ExerciseMainView()
                                .tag(TabSelection(rawValue: 1))
                            InbodyMainView()
                                .tag(TabSelection(rawValue: 2))
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        CustomTabBarView()
                    }
                    .environmentObject(tabViewModel)
                }
            }
        }
        .environmentObject(navigationPathFinder)
    }
}
