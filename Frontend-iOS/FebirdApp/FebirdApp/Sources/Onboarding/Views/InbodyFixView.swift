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
            OnboardingGaugeView(progress: 7)
                .padding(.top, 24)
                .padding(.bottom, 34)
            Text("정보가 다르게 인식됐나요? \n여기에서 수정할 수 있어요 😉")
                .font(.customFont(size: 20, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                .padding(.bottom, 46)
            VStack(spacing: 20, content: {
                OnboardingTextField(question: "체중 *", placeholder: "46.3", unit: "kg", inputValue: "46.3", text: $weight)
                OnboardingTextField(question: "키 *", placeholder: "160.3", unit: "cm", inputValue: "160.2", text: $height)
                OnboardingTextField(question: "BMI", placeholder: "17.6", unit: "%", inputValue: "17.6", text: $bmi)
                OnboardingTextField(question: "체지방량", placeholder: "9.6", unit: "%", inputValue: "9.6", text: $bodyfat)
                OnboardingTextField(question: "기초대사량", placeholder: "kcal", unit: "kg", inputValue: "46.3", text: $bmr)
            }).padding(.horizontal, 46)

            Button(action: {
                showActionSheet = true
            }, label: {
                Text("다시찍기")
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
            .padding(.top, 40)
            .padding(.horizontal, 24)

            Button(action: {
                // TODO: 백엔드에 회원 정보 저장
                navigationPathFinder.addPath(option: .eyeBodyView)
            }, label: {
                Text("저장하기")
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    InbodyFixView(weight: "46.3", height: "160.2", bmi: "17.6", bodyfat: "9.6", bmr: "1163")
}
