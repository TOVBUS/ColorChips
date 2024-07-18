//
//  OnboardingSelectUserInfoView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingSelectUserInfoView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var selectedGender: Gender = .female

    var body: some View {
        VStack(spacing: 28) {
            OnboardingGaugeView(progress: 2)
            HStack {
                Text("프로필 이미지를 하나 골라주세요!")
                    .font(.customFont(language: .korean, size: 14, weight: .bold))
                Spacer()
            }
            OnboardingProfileSelectionView(selectedImageIndex: 1)
            HStack {
                Text("어떻게 불러드릴까요?").font(.customFont(language: .korean, size: 14, weight: .bold))
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

            OnboardingTextField(question: "나이가 어떻게 되세요?", placeholder: "17세", unit: "세", text: $age)

            HStack {
                Text("성별을 알려주세요!").font(.customFont(language: .korean, size: 14, weight: .bold))
                Spacer()
            }
            OnboardingSelectGenderButton()

            Button("입력하기") {

            }
            .frame(maxWidth: .infinity, maxHeight: 56)
            .foregroundStyle(Color(.white))
            .font(.customFont(language: .korean, size: 16, weight: .semibold))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
            )
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    OnboardingSelectUserInfoView()
}