//
//  ProfileSettingView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ProfileSettingView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: 185)
                    .foregroundStyle(.gray100)
                    .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()

                HStack(alignment: .center, spacing: 12) {
                    Image("backButton")
                    
                    Text("프로필 설정")
                        .foregroundStyle(.white)
                        .font(.customFont(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    Spacer()
                }
                .padding(.top, -55)
                .padding(.horizontal, 20)

                Image("profile01")
                    .padding(.top, 121)

                ZStack {
                   Image("cameraButton")
                        .padding(.top, 210)
                        .padding(.leading, 110)
                }
            }

            VStack(spacing: 20) {
                HStack {
                    Text("닉네임").font(.customFont(size: 14, weight: .bold))
                    Spacer()
                }

                HStack(spacing: 8) {
                    Image("personIcon")
                        .padding()

                    TextField("어떻게 불러드릴까요?", text: .constant("꽥꽥이"))

                    Image("pencilIcon")
                        .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.orange40, lineWidth: 1)
                        .fill(.gray10)
                )
                .padding(.horizontal, 0)

                OnboardingTextField(question: "나이", placeholder: "17세", unit: "세", inputValue: nil, text: .constant("16"))

                HStack {
                    Text("성별").font(.customFont(size: 14, weight: .bold))
                    Spacer()
                }

                OnboardingSelectGenderButton()
                    .padding(.bottom, 70)

                Button(action: {
                    // TODO: 프로필 변경 내역 저장
                }, label: {
                    Text("저장하기")
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .foregroundStyle(Color(.white))
                        .font(.customFont(size: 16, weight: .semibold))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray100)
                        )
                })
            }
            .padding(25)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileSettingView()
}
