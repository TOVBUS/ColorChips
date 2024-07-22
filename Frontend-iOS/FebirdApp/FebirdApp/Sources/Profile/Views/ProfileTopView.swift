//
//  ProfileTopView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct ProfileTopView: View {
    var body: some View {

        VStack {
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 16) {
                    Image("profile06")
                        .resizable()
                        .frame(width: 80, height: 80)

                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            VStack {
                                Text("JULY 16, 2024")
                                    .font(.customFont(size: 10, weight: .bold, language: .english))
                                    .kerning(1)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)

                                HStack(spacing: 0, content: {
                                    Text("꽥꽥이")
                                        .font(.customFont(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(height: 50)
                                    Text("님")
                                        .font(.customFont(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(height: 50)
                                })
                            }
                            Spacer()
                            VStack {
                                Button(action: {}, label: {
                                    Image("settingIcon")
                                })
                                Spacer()
                            }
                        }

                        HStack(alignment: .center, spacing: 8) {
                            HStack(alignment: .center, spacing: 4) {
                                Image("SolidFire")

                                Text("피오유치원")
                                    .font(.customFont(size: 12, weight: .regular))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .padding(0)

                            Image("SandowCore")

                            HStack(alignment: .center, spacing: 4) {
                                Text("🌱")
                                    .font(.customFont(size: 14, weight: .medium, language: .english))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)

                                Text("새싹반")
                                    .font(.customFont(size: 12, weight: .regular))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            Image("SandowCore")

                            HStack(alignment: .center, spacing: 4) {
                                Text("💪🏻")
                                    .font(.customFont(size: 14, weight: .medium, language: .english))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)

                                Text("2일차")
                                    .font(.customFont(size: 12, weight: .regular))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: .infinity)
            ProfileSelectView()
                .padding(.horizontal, 22)
        }
        .padding(.top, 26)
        .padding(.vertical, 30)
        .frame(alignment: .center)
        .frame(height: 240)
        .background(.gray100)
        .clipShape(
            RoundedCorners(
                topLeft: 0,
                topRight: 0,
                bottomLeft: 34,
                bottomRight: 34
            )
        )
    }
}

#Preview {
    ProfileTopView()
}
