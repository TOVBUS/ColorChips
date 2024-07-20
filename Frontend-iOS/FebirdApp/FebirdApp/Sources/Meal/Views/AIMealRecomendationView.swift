//
//  AIMealRecomendationView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI

struct AIMealRecomendationView: View {
    var body: some View {
        ZStack {
            Image("aiMeal")
            VStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 16) {
                        Text("피오추천")
                            .font(.customFont(size: 12, weight: .bold))
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .frame(height: 24, alignment: .center)
                    .background(Color.orange50)
                    .cornerRadius(8)
                    // 추천받은 식단명
                    Text("샐러디 웜랩")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    // 추천받은 식단의 칼로리, 식단 시간대
                    Group {
                        HStack(alignment: .center, spacing: 4) {
                            Image("fireIcon")
                            Text("251Kcal")
                        }
                        HStack(alignment: .center, spacing: 4) {
                            Image("dinnerIcon")
                            Text("오전식단")
                        }
                    }
                    .foregroundStyle(Color.white)
                    .font(.customFont(size: 14, weight: .medium))
                    // 식단챗봇으로 넘어가는 버튼
                    Button(action: {
                        // 챗봇뷰
                    }, label: {
                        HStack(alignment: .center, spacing: 8) {
                            Text("식단추천받기")
                            Text("+")
                        }
                        .font(.customFont(size: 14, weight: .semibold))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .frame(height: 40, alignment: .center)
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                    })
                }
                .padding([.top, .leading], 10)
                .frame(width: 320, alignment: .topLeading)

            }
        }
        .padding(16)
//        .frame(maxWidth: .infinity, alignment: .topLeading)
//        .background(Color.gray100)
        .cornerRadius(32)
    }
}

#Preview {
    AIMealRecomendationView()
}
