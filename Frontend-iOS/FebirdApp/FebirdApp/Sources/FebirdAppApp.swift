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
    // ViewModel 객체들 초기화
    @StateObject private var tabViewModel = TabViewModel()
    @StateObject private var albumViewModel = AlbumViewModel()
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
    @StateObject private var profileSelectViewModel = ProfileSelectViewModel()
    @StateObject private var profileSettingViewModel = ProfileSettingViewModel()
    @StateObject private var azureInbodyViewModel = AzureInbodyViewModel()
    @StateObject private var authViewModel = AuthViewModel()

    let modelContainer: ModelContainer

    init() {
        do {
            // ModelContainer 초기화
            modelContainer = try ModelContainer(for: EyeBodyPhoto.self, LevelRecordData.self, DailyMemo.self, MealMemo.self)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            Group {
                // 로그인 여부에 따라 화면을 분기
                if !authViewModel.loginResult {
                    SocialLoginView()
                } else {
                    // 메인 화면
                    MainView()
                        .environmentObject(tabViewModel)
                        .environmentObject(albumViewModel)
                        .environmentObject(mealNavigationPathFinder)
                        .environmentObject(exerciseNavigationPathFinder)
                        .environmentObject(profileNavigationPathFinder)
                        .environmentObject(chatViewModel)
                        .environmentObject(historyViewModel)
                        .environmentObject(profileSelectViewModel)
                        .environmentObject(profileSettingViewModel)
                        .environmentObject(routineViewModel)
                        .environmentObject(levelViewModel)
                        .environmentObject(exerciseViewModel)
                        .environmentObject(inbodyViewModel)
                        .environmentObject(azureInbodyViewModel)
                        .environmentObject(memberViewModel)
                        .environmentObject(authViewModel)
                        .modelContainer(modelContainer)
                }
            }
            .environmentObject(authViewModel)
            .environmentObject(onboardingNavigationPathFinder)
        }
    }
}
