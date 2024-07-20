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
                .foregroundStyle(Color.gray100)
            .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            VStack {
                Text("나의 식단 기록")
                    .padding(.top, 20)
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(Color.white)
                WeeklyCalendar()
                    .padding(.top, -10)
            }
        }
    }
}

#Preview {
    MealMainheaderView()
}

// 사각형 모서리 둥글게 처리
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
