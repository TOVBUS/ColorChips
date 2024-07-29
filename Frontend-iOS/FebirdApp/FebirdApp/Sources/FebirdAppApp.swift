//
//  FebirdAppApp.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/4/24.
//

import SwiftUI

@main
struct FebirdAppApp: App {
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
                    ExerciseMainView()
                }
            }
        }
        .environmentObject(navigationPathFinder)
    }
}
