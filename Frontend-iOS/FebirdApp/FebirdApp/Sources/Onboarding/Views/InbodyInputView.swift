//
//  InbodyInputView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct InbodyInputView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>

    @State var weight: String
    @State var height: String
    @State var bmi: String
    @State var bodyfat: String
    @State var bmr: String
    @State private var showActionSheet = false

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 5)

            VStack {

                ScrollView {
                    Text("체중과 키를 기록하면 변화를 그래프로 보여드릴게요 😉")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                        .padding(.bottom, 46)

                    VStack(spacing: 20, content: {
                        OnboardingTextField(question: "체중 *", placeholder: "46.3", unit: "kg", inputValue: nil, text: $weight)
                        OnboardingTextField(question: "키 *", placeholder: "160.3", unit: "cm", inputValue: nil, text: $height)
                        OnboardingTextField(question: "BMI", placeholder: "17.6", unit: "%", inputValue: nil, text: $bmi)
                        OnboardingTextField(question: "체지방량", placeholder: "9.6", unit: "%", inputValue: nil, text: $bodyfat)
                        OnboardingTextField(question: "기초대사량", placeholder: "kcal", unit: "kg", inputValue: nil, text: $bmr)
                    })
                    .padding(.horizontal, 46)
                }

                CustomButtonView(title: "저장하기") {
                    // TODO: 데이터 저장 로직 구현 - SwiftData
                }

                CustomButtonView(title: "건너뛰기") {
                    navigationPathFinder.addPath(option: .onboardingEndView)
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    InbodyInputView(weight: "", height: "", bmi: "", bodyfat: "", bmr: "")
}
