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
        VStack {
            MealMainheaderView()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("AI 식단추천")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                    
                    AIMealRecomendationView()
                    
                    Text("식단 기록")
                        .foregroundStyle(.gray100)
                        .font(.customFont(size: 20, weight: .bold))
                    
                    ForEach(meals, id: \.self) { meal in
                        MemoRow(mealTime: meal)
                    }
                }
                .padding()
            }
            .padding(.bottom, ConstantsPadding.onCustomTabBar.rawValue)
        }
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    MealMainView()
}
