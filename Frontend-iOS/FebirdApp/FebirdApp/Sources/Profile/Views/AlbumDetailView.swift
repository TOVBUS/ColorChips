//
//  AlbumDetailView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct AlbumDetailView: View {
    var body: some View {
        VStack {
            Text("DAY 1")
                .font(.customFont(size: 30, weight: .bold, language: .english))
                .padding(.bottom, 10)

            Text("2024년 07월 11일")
                .font(.customFont(size: 20, weight: .bold))
                .padding(.bottom, 21)

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 300, height: 300)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: -2, y: -2)

                Image("peoLogo")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipped()
            }
            .padding(.bottom, 30)

            HStack {
                Image("SolidFire")
                Text("총 운동시간")
                    .font(.customFont(size: 18, weight: .medium))
                Spacer()
                Text("00:21:34")
                    .font(.customFont(size: 18, weight: .medium))
            }
            .padding(.horizontal, 46)

            HStack {
                Image("SolidFire")
                Text("총 칼로리")
                    .font(.customFont(size: 18, weight: .medium))

                Spacer()

                Text("234 kcal")
                    .font(.customFont(size: 18, weight: .medium, language: .english))
            }
            .padding(.horizontal, 46)

            Button(action: {
                // TODO: 운동루틴 뷰로 이동
            }, label: {
                HStack {
                    Text("운동루틴")
                        .foregroundStyle(.black)
                        .font(.customFont(size: 16, weight: .semibold))

                    Spacer()

                    Image("Chevron-right")
                }
                .padding(.horizontal, 12)
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                )
            })
            .padding(.horizontal, 26)
        }
    }
}

#Preview {
    AlbumDetailView().background(.gray10)
}
