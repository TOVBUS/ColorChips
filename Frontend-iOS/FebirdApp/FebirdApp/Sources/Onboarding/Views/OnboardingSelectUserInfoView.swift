//
//  OnboardingSelectUserInfoView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingSelectUserInfoView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>

    @State private var name = ""
    @State private var age = ""
    @State private var selectedGender: Gender = .female

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 2)
            ScrollView {
                VStack(spacing: 28) {
                    HStack {
                        Text("프로필 이미지를 하나 골라주세요!")
                            .font(.customFont(size: 14, weight: .bold))

                        Spacer()
                    }

                    OnboardingProfileSelectionView(selectedImageIndex: 1)

                    HStack {
                        Text("어떻게 불러드릴까요?")
                            .font(.customFont(size: 14, weight: .bold))

                        Spacer()
                    }
                    HStack {
                        Image("personIcon")
                        TextField("어떻게 불러드릴까요?", text: $name)
                        Image("pencilIcon")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 0.98, green: 0.45, blue: 0.09), lineWidth: 1)
                            .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                    )

                    OnboardingTextField(
                        question: "나이가 어떻게 되세요?",
                        placeholder: "17세",
                        unit: "세",
                        inputValue: nil,
                        text: $age
                    )

                    HStack {
                        Text("성별을 알려주세요!")
                            .font(.customFont(size: 14, weight: .bold))

                        Spacer()
                    }

                    OnboardingSelectGenderButton(selectedGender: .constant(.female))

                }
                .padding(.horizontal, 24)
            }
        }

        CustomButtonView(title: "입력하기") {
            // TODO: API POST 로직 추가
//            navigationPathFinder.addPath(option: .inbodyAddView)
            navigationPathFinder.addPath(option: .inbodyInputView)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingSelectUserInfoView()
}
