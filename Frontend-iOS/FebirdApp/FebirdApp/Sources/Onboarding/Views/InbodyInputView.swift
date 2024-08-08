//
//  InbodyInputView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct InbodyInputView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var inbodyViewModel: InbodyViewModel

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
                        OnboardingTextField(question: "체중 *", placeholder: "\(inbodyViewModel.userInbody.weight)", unit: "kg", inputValue: nil, keyboardType: .numberPad, autoFocus: true, text: $weight)
                        OnboardingTextField(question: "키 *", placeholder: "\(inbodyViewModel.userInbody.height)", unit: "cm", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $height)
                        OnboardingTextField(question: "BMI", placeholder: "17.6", unit: "%", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bmi)
                        OnboardingTextField(question: "체지방량", placeholder: "9.6", unit: "%", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bodyfat)
                        OnboardingTextField(question: "기초대사량", placeholder: "kcal", unit: "kg", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bmr)
                    })
                    .padding(.horizontal, 30)
                }

                CustomButtonView(title: "저장하기") {
                    // TODO: 데이터 저장 로직 구현 - DB
                    navigationPathFinder.addPath(option: .onboardingEndView)
                }

                CustomButtonView(title: "건너뛰기") {
                    navigationPathFinder.addPath(option: .onboardingEndView)
                }
                .navigationBarBackButtonHidden()
            }
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
    }
}

// #Preview {
//    InbodyInputView(weight: "", height: "", bmi: "", bodyfat: "", bmr: "")
// }
