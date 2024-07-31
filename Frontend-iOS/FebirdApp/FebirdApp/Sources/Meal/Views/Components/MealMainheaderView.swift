//
//  MealMainheaderView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/20/24.
//

import SwiftUI

struct MealMainheaderView: View {
    var body: some View {
        VStack {
            Text("나의 식단 기록")
                .font(.customFont(size: 22, weight: .bold))
                .foregroundStyle(.white)
                .padding(.top, 60)

            WeeklyCalendar()
                .padding(.bottom, 24)
        }
        .background(
            ZStack {
                Rectangle()
                    .frame(minHeight: 240)
                    .foregroundStyle(.white)
                
                Rectangle()
                    .frame(minHeight: 240)
                    .foregroundStyle(.gray100)
                    .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            }
        )
        .background(ignoresSafeAreaEdges: .top)
    }
}

#Preview {
    MealMainheaderView()
}
