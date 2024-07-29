//
//  AIMealRecomendationView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI

struct AIMealRecomendationView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                Image("aiMeal")
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("피오추천")
                                .font(.customFont(size: 12, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.orange50)
                        .cornerRadius(8)
                        // MARK: - 추천받은 식단명
                        Text("샐러디 웜랩")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        // MARK: - 추천받은 식단의 칼로리, 식단 시간대
                        Group {
                            HStack(spacing: 4) {
                                Image("fireIcon")
                                Text("251Kcal")
                            }
                            HStack(spacing: 4) {
                                Image("dinnerIcon")
                                Text("오전식단")
                            }
                        }
                        .foregroundStyle(.white)
                        .font(.customFont(size: 14, weight: .medium))
                        // MARK: - 식단추천 버튼
                        Button(action: {
                        }, label: {
                            HStack(spacing: 8) {
                                Text("식단추천받기")
                                Text("+")
                            }
                            .font(.customFont(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .inset(by: 0.5)
                                    .stroke(.white, lineWidth: 1)
                            )
                        })
                    }
                    .padding(.leading, 10)
                    .frame(width: 320, alignment: .topLeading)
                }
            }
        }
    }
}

#Preview {
    AIMealRecomendationView()
}
