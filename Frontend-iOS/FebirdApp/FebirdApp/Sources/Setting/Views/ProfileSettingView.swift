//
//  ProfileSettingView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ProfileSettingView: View {

    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var profilleSettingViewModel: ProfileSettingViewModel
    @EnvironmentObject private var tabViewModel: TabViewModel
    @EnvironmentObject private var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                ProfileSettingHeaderView()

                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("닉네임")
                                .font(.customFont(size: 14, weight: .bold))
                                .foregroundStyle(.gray100)
                            Spacer()
                        }

                        HStack(spacing: 8) {
                            Image("personIcon")
                                .padding()

                            TextField("어떻게 불러드릴까요?", text: $profilleSettingViewModel.nickname)
                                .font(.customFont(size: 18, weight: .medium))
                                .foregroundColor(profilleSettingViewModel.nickname.isEmpty ? .gray40 : .gray100)

                            Image("pencilIcon")
                                .padding()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(profilleSettingViewModel.isFocused ? .orange40 : .clear, lineWidth: 1)
                                .fill(.gray10)
                        )
                        .padding(.horizontal, 0)

                        OnboardingTextField(question: "나이", placeholder: "17세", unit: "세", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $profilleSettingViewModel.age)

                        HStack {
                            Text("성별")
                                .font(.customFont(size: 14, weight: .bold))
                                .foregroundStyle(.gray100)
                            Spacer()
                        }

                        OnboardingSelectGenderButton(selectedGender: $profilleSettingViewModel.gender)
                            .padding(.bottom, 70)
                    }
                    .padding(25)

                    CustomButtonView(title: "저장하기") {
                        profilleSettingViewModel.saveProfile()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .onAppear {
            tabViewModel.isHidden = true
        }
    }
}

#Preview {
    ProfileSettingView()
        .environmentObject(TabViewModel())
        .environmentObject(ProfileSettingViewModel())
}
