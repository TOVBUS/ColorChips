//
//  CustomButtonView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/19/24.
//

import SwiftUI

enum CustomButtonType {
    case black
    case orange
}

struct CustomButtonView: View {
    var title: String
    var type: CustomButtonType = .black

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(title)
                .font(.customFont(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56, alignment: .center)
        .background(type == .black ? .gray100 : .orange50)
        .cornerRadius(20)
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomButtonView(title: "운동 시작하기")
}
