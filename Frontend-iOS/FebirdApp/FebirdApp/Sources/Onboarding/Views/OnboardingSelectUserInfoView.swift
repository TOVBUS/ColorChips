//
//  OnboardingSelectUserInfoView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingSelectUserInfoView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var memberViewModel : MemberViewModel
    @EnvironmentObject var profilleSettingViewModel : ProfileSettingViewModel

    @State private var name = ""
    @State private var age = ""
    @State private var selectedGender: UserProfile.Gender = .female

    var body: some View {
        VStack {
            OnboardingGaugeView(progress: 3)
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
                            .onChange(of: name) { _, newValue in
                                memberViewModel.newMember.nickname = newValue
                            }
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
                        keyboardType: .numberPad,
                        autoFocus: false, text: $age
                    ).onChange(of: age) {
                        memberViewModel.newMember.age = Int(age)
                    }

                    HStack {
                        Text("성별을 알려주세요!")
                            .font(.customFont(size: 14, weight: .bold))

                        Spacer()
                    }

                    OnboardingSelectGenderButton(selectedGender: $selectedGender)
                        .onChange(of: selectedGender) {
                            memberViewModel.newMember.gender = selectedGender.rawValue
                        }
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .padding(.horizontal, 24)
            }
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )

        CustomButtonView(title: "입력하기") {
            // TODO: API POST 로직 추가
            navigationPathFinder.addPath(option: .inbodyAddView)
        }
        .navigationBarBackButtonHidden()
    }
}
