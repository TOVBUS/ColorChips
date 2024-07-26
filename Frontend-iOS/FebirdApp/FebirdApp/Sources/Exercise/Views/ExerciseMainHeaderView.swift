//
//  ExerciseMainHeaderView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainHeaderView: View {

    @State private var progress: CGFloat = 0.5 // 예시 값

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 16) {
                    Image("profile06")
                        .resizable()
                        .frame(width: 80, height: 80)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("JULY 16, 2024")
                            .font(.customFont(size: 10, weight: .bold, language: .english))
                            .kerning(1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)

                        HStack {
                            Text("꽥꽥이님이 접속하다니\n이거 완전 럭키비키잖앙 🍀")
                                .font(.customFont(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(height: 50)

                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 50, height: 50)
                                .background(
                                    ZStack {
                                        Image("peoLogo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipped()

                                        Image("NotificationPopup8")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .offset(x: 14, y: -10)
                                    }
                                )
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
            }
            .frame(maxWidth: .infinity)

            ExerciseGaugeBarView(progress: $progress, totalSteps: 3)
        }
        .padding(.top, 26)
        .padding(.vertical, 30)
        .frame(alignment: .center)
        .background(.gray100)
        .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
    }
}

#Preview {
    ExerciseMainHeaderView()
}
