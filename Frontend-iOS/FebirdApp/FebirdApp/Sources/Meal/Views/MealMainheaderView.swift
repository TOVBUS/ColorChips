//
//  MealMainheaderView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/20/24.
//

import SwiftUI

struct MealMainheaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 240)
                .foregroundStyle(.gray100)
            .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            VStack {
                Text("나의 식단 기록")
                    .padding(.top, 20)
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.white)
                WeeklyCalendar()
                    .padding(.top, -10)
            }
        }
    }
}

#Preview {
    MealMainheaderView()
}
