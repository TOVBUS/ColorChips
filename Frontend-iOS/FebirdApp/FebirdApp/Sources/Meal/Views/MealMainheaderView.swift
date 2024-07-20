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
                .frame(height: 230)
                .foregroundStyle(Color.black)
            .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            VStack {
                WeeklyCalendar()
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
