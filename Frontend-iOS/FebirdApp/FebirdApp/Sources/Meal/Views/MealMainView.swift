//
//  MealMainView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI

struct MealMainView: View {
    let meals = ["아침", "점심", "저녁"]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.white)
                .ignoresSafeArea()
            VStack(spacing: 24) {
                MealMainheaderView()
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("AI 식단추천")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundStyle(Color.gray100)
                            .padding(.leading, 20)
                        AIMealRecomendationView()
                        Text("식단 기록")
                            .padding(.leading, 20)
                            .foregroundStyle(Color.gray100)
                            .font(.customFont(size: 20, weight: .bold))
                        ForEach(meals, id: \.self) { meal in
                            MemoRow(mealTime: meal)
                        }
                        .padding(.leading, 20)
                        .foregroundStyle(Color.gray100)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}
    #Preview {
        MealMainView()
    }
