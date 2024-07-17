//
//  OnboardingSelectUserInfoView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingSelectUserInfoView: View {
    @State private var name = ""
    //@State private var selectedGender: Gender = .female

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 2)
            Text("프로필 이미지를 하나 골라주세요!")
                .font(.customFont(language: .korean, size: 16, weight: .bold))
            OnboardingProfileSelectionView(selectedImageIndex: 1)
            Text("어떻게 불러드릴까요?")
            HStack {
                Image("personIcon")
                TextField("어떻게 불러드릴까요?", text: $name)
                Image("pencilIcon")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: 0xF97316), lineWidth: 1)
                    .fill(Color.gray)
            )
        }
    }
}

#Preview {
    OnboardingSelectUserInfoView()
}
