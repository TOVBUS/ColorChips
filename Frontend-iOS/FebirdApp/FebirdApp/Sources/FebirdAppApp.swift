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
    @StateObject private var tabViewModel = TabViewModel()
    @StateObject private var albumViewModel = AlbumViewModel()
    @StateObject private var socialLoginViewModel = SocialLoginViewModel()
    @StateObject private var onboardingNavigationPathFinder = NavigationPathFinder<OnboardingViewOptions>()
    @StateObject private var mealNavigationPathFinder = NavigationPathFinder<MealViewOptions>()
    @StateObject private var exerciseNavigationPathFinder = NavigationPathFinder<ExerciseViewOptions>()
    @StateObject private var profileNavigationPathFinder = NavigationPathFinder<ProfileViewOptions>()
    @StateObject private var chatViewModel = ChatViewModel()
    @StateObject private var routineViewModel = RoutineViewModel()
    @StateObject private var levelViewModel = LevelViewModel()
    @StateObject private var exerciseViewModel = ExerciseViewModel()
    @StateObject private var inbodyViewModel = InbodyViewModel()
    @StateObject private var historyViewModel = HistoryViewModel()
    @StateObject private var memberViewModel = MemberViewModel()

    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: UserProfile.self, EyeBodyPhoto.self, LevelRecordData.self, DailyMemo.self, MealMemo.self)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            Group {
            //            if socialLoginViewModel.loginResult == nil {
            //                SocialLoginView()
            //                    .environmentObject(socialLoginViewModel)
            //            } else
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
                .onAppear(perform: {
                    socialLoginViewModel.checkNickname()
                })
                .environmentObject(chatViewModel)
                .environmentObject(routineViewModel)
                .environmentObject(levelViewModel)
                .environmentObject(exerciseViewModel)
                .environmentObject(inbodyViewModel)
                .environmentObject(historyViewModel)
        }
        .environmentObject(memberViewModel)
        .onChange(of: socialLoginViewModel.hasNickname, { _, newValue in
            if let hasNickname = newValue {
                onboardingNavigationPathFinder.setIsFirstenteredApp(!hasNickname)
            }
        })
        .modelContainer(modelContainer)
    }
}
