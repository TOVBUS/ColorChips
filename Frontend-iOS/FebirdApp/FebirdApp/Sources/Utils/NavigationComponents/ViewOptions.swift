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
