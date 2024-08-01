//
//  FebirdAppApp.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/4/24.
//

import SwiftUI

@main
struct FebirdAppApp: App {
    @StateObject var tabViewModel = TabViewModel()
    @StateObject private var onboardingNavigationPathFinder = NavigationPathFinder<OnboardingViewOptions>()
    @StateObject private var mealNavigationPathFinder = NavigationPathFinder<MealViewOptions>()
    @StateObject private var profileNavigationPathFinder = NavigationPathFinder<ProfileViewOptions>()

    var body: some Scene {
        WindowGroup {
            if onboardingNavigationPathFinder.isFirstEnteredApp {
                NavigationStack(path: $onboardingNavigationPathFinder.path) {
                    OnboardingWelcomView()
                        .navigationDestination(for: OnboardingViewOptions.self) { option in
                            option.view()
                        }
                }
                .environmentObject(onboardingNavigationPathFinder)
            } else {
                ZStack(alignment: .bottom) {
                    switch tabViewModel.selectedTab {
                    case .meal:
                        NavigationStack(path: $mealNavigationPathFinder.path) {
                            MealMainView()
                                .navigationDestination(for: MealViewOptions.self) { option in
                                    option.view()
                                }
                        }
                    case .exercise:
                        ExerciseMainView()
                    case .profile:
                        NavigationStack(path: $profileNavigationPathFinder.path) {
                            InbodyMainView()
                                .navigationDestination(for: ProfileViewOptions.self) { option in
                                    option.view()
                                }
                        }
                    }
                    CustomTabBarView()
                }
                .environmentObject(tabViewModel)
                .environmentObject(mealNavigationPathFinder)
                .environmentObject(profileNavigationPathFinder)
            }
        }
    }
}
