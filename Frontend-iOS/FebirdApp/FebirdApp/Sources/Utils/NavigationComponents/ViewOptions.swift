//
//  ViewOptions.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/28/24.
//

import SwiftUI

protocol ViewOptions: Hashable {
    associatedtype ContentView: View
    @ViewBuilder func view() -> ContentView
}

enum OnboardingViewOptions: Hashable, ViewOptions {
    case onboardingWelcome
    case onboardingSelectUserInfo
    case inbodyAddView
    case onboardingLoadingView
    case inbodyFixView
    case inbodyInputView
    case onboardingEndView
    case eyeBodyView

    @ViewBuilder func view() -> some View {
        switch self {
        case .onboardingWelcome:
            OnboardingWelcomView()
        case .onboardingSelectUserInfo:
            OnboardingSelectUserInfoView()
        case .inbodyAddView:
            InbodyAddView()
        case .onboardingLoadingView:
            OnboardingLoadingView()
        case .inbodyFixView:
            InbodyFixView()
        case .inbodyInputView:
            InbodyInputView(weight: "", height: "", bmi: "", bodyfat: "", bmr: "")
        case .onboardingEndView:
            OnboardingEndView()
        case .eyeBodyView:
            EyeBodyView()
        }
    }
}

enum MealViewOptions: Hashable, ViewOptions {
    case mealMainView
    case mealChatBotView

    @ViewBuilder func view() -> some View {
        switch self {
        case .mealMainView:
            MealMainView()
        case .mealChatBotView:
            MealChatBotView()
        }
    }
}

enum ProfileViewOptions: Hashable, ViewOptions {
    case profileMainView
    case settingView
    case profileSettingView
    case eyeBodyView(isOnboarding: Bool)
    case inbodyInputView

    @ViewBuilder func view() -> some View {
        switch self {
        case .profileMainView:
            ProfileMainView()
        case .settingView:
            SettingsView()
        case .profileSettingView:
            ProfileSettingView()
                .environmentObject(ProfileSettingViewModel())
        case .eyeBodyView(let isOnboarding):
            EyeBodyView(isOnboarding: isOnboarding)
        case .inbodyInputView:
            InbodyInputView(weight: "", height: "", bmi: "", bodyfat: "", bmr: "")
        }
    }
}

enum ExerciseViewOptions: Hashable, ViewOptions {
    case exerciseMainView
    case exerciseGuideView(isStarted: Bool)
    case exerciseTimerSettingView
    case exerciseRestTimerView
    case exerciseRoutineLogView
    case exerciseRoutineCompletionView
    case exerciseGraduationView
    case exerciseRecordView
    case exerciseChatBotView
    case exerciseCountView(ExerciseDetector, ExerciseType, Int)

    @ViewBuilder func view() -> some View {
        switch self {
        case .exerciseMainView:
            ExerciseMainView()
        case .exerciseGuideView(let isStarted):
            ExerciseGuideView(isStarted: .constant(isStarted))
        case .exerciseTimerSettingView:
            ExerciseTimerSettingView()
        case .exerciseRestTimerView:
            ExerciseRestTimerView()
        case .exerciseRoutineLogView:
            ExerciseRoutineLogView()
        case .exerciseRoutineCompletionView:
            ExerciseRoutineCompletionView()
        case .exerciseGraduationView:
            ExerciseGraduationView()
        case .exerciseRecordView:
            ExerciseRecordView()
        case .exerciseChatBotView:
            ExerciseChatBotView()
        case .exerciseCountView(let detector, let exercise, let count):
            ExerciseCountView(exerciseDetector: detector, selectedExercise: exercise, totalCount: count)
        }
    }
}
