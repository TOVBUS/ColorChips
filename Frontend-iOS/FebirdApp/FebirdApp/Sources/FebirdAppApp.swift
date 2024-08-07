//
//  FebirdAppApp.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/4/24.
//

import SwiftUI
import SwiftData

@main
struct FebirdAppApp: App {
    @StateObject var tabViewModel = TabViewModel()
    @StateObject var albumViewModel = AlbumViewModel()
    @StateObject private var onboardingNavigationPathFinder = NavigationPathFinder<OnboardingViewOptions>()
    @StateObject private var mealNavigationPathFinder = NavigationPathFinder<MealViewOptions>()
    @StateObject private var exerciseNavigationPathFinder = NavigationPathFinder<ExerciseViewOptions>()
    @StateObject private var profileNavigationPathFinder = NavigationPathFinder<ProfileViewOptions>()

    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: UserProfile.self, EyeBodyPhoto.self, LevelRecordData.self)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
           // SocialLoginView() }   // apple sign test
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
                        NavigationStack(path: $exerciseNavigationPathFinder.path) {
                            ExerciseMainView()
                                .navigationDestination(for: ExerciseViewOptions.self) { option in
                                    option.view()
                                }
                        }
                    case .profile:
                        NavigationStack(path: $profileNavigationPathFinder.path) {
                            ProfileMainView()
                                .navigationDestination(for: ProfileViewOptions.self) { option in
                                    option.view()
                                }
                        }
                    }
                    CustomTabBarView()
                }
                .environmentObject(tabViewModel)
                .environmentObject(albumViewModel)
                .environmentObject(mealNavigationPathFinder)
                .environmentObject(exerciseNavigationPathFinder)
                .environmentObject(profileNavigationPathFinder)
            }
        }
        .modelContainer(modelContainer)
    }
}
