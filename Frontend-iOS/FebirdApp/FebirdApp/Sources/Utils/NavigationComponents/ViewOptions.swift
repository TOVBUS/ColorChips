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
            InbodyFixView(weight: "고쳐야됨", height: "고쳐야됨", bmi: "고쳐야됨", bodyfat: "고쳐야됨", bmr: "고쳐야됨")
        case .inbodyInputView:
            InbodyInputView(weight: "고쳐야됨", height: "고쳐야됨", bmi: "고쳐야됨", bodyfat: "고쳐야됨", bmr: "고쳐야됨")
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
    case profileAlbumMainView
    case profileInbodyMainView
    case profileEyeBodyMainView

    @ViewBuilder func view() -> some View {
        switch self {
        case .profileMainView:
            ProfileMainView()
        case .profileAlbumMainView:
            AlbumMainView(albums: dummyAlbums)
        case .profileInbodyMainView:
            InbodyMainView()
        case .profileEyeBodyMainView:
            EyeBodyView()
        }
    }
}

enum ExerciseViewOptions: Hashable, ViewOptions {
    case exerciseMainView
    case exerciseGuideView
    case exerciseTimerSettingView
    case exerciseRestTimerView
    case exerciseRoutineLogView
    case exerciseRoutineCompletionView
    case exerciseGraduationView
    case exerciseRecordView
    case exerciseChatBotView
    case exerciseCountView

    @ViewBuilder func view() -> some View {
        switch self {
        case .exerciseMainView:
            ExerciseMainView()
        case .exerciseGuideView:
            ExerciseGuideView()
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
        case .exerciseCountView:
            ExerciseCountView()
        }
    }
}
