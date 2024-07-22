//
//  CustomButtonView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/19/24.
//

import SwiftUI

struct CustomButtonView: View {
    var title: String

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(title)
                .font(.customFont(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56, alignment: .center)
        .background(.gray100)
        .cornerRadius(20)
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomButtonView(title: "운동 시작하기")
}
