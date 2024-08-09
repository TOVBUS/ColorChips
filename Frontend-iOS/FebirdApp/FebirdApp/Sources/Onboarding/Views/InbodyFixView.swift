//
//  InbodyFixView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyFixView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>

    @State var weight: String
    @State var height: String
    @State var bmi: String
    @State var bodyfat: String
    @State var bmr: String
    @State private var showActionSheet = false

    var body: some View {
        ScrollView {
            OnboardingGaugeView(progress: 4)

            Text("정보가 다르게 인식됐나요? \n여기에서 수정할 수 있어요 😉")
                .font(.customFont(size: 20, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                .padding(.bottom, 46)

            VStack(spacing: 20, content: {
                OnboardingTextField(question: "체중 *", placeholder: "46.3", unit: "kg", inputValue: "46.3", keyboardType: .numberPad, autoFocus: false, text: $weight)
                OnboardingTextField(question: "키 *", placeholder: "160.3", unit: "cm", inputValue: "160.2", keyboardType: .numberPad, autoFocus: false, text: $height)
                OnboardingTextField(question: "BMI", placeholder: "17.6", unit: "%", inputValue: "17.6", keyboardType: .numberPad, autoFocus: false, text: $bmi)
                OnboardingTextField(question: "체지방량", placeholder: "9.6", unit: "%", inputValue: "9.6", keyboardType: .numberPad, autoFocus: false, text: $bodyfat)
                OnboardingTextField(question: "기초대사량", placeholder: "kcal", unit: "kg", inputValue: "46.3", keyboardType: .numberPad, autoFocus: false, text: $bmr)
            }).padding(.horizontal, 20)

            CustomButtonView(title: "다시찍기") {
                showActionSheet = true
            }
            .padding(.top, 40)

            CustomButtonView(title: "저장하기") {
                // TODO: 백엔드에 회원 정보 저장
                navigationPathFinder.addPath(option: .eyeBodyView)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

// #Preview {
//    InbodyFixView(weight: "46.3", height: "160.2", bmi: "17.6", bodyfat: "9.6", bmr: "1163")
// }
