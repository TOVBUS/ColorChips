//
//  AIMealRecomendationView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI

struct AIMealRecomendationView: View {
    @EnvironmentObject var mealNavigationPathFinder: NavigationPathFinder<MealViewOptions>
    
    var body: some View {
        ZStack {
            Image("aiMeal")
            
            VStack(alignment: .leading) {
                Text("피오추천")
                    .font(.customFont(size: 12, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.orange50)
                    .cornerRadius(8)
                    .padding(.top, 16)
                
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
                
                // MARK: - 식단추천 버튼(오른쪽 정렬)
                HStack {
                    Spacer()
                    
                    Button(action: {
                        mealNavigationPathFinder.addPath(option: .mealChatBotView)
                    }, label: {
                        HStack(spacing: 8) {
                            Text("식단추천받기")
                            Text("+")
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .font(.customFont(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                    })
                }
                .padding(.trailing, 32)
                .padding(.bottom, 12)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.leading, 32)
        }
    }
}

#Preview {
    AIMealRecomendationView()
}
