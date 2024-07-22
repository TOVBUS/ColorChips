//
//  CustomButtonView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/19/24.
//

import SwiftUI

enum CustomButtonStyle {
    case orange
    case black
    case warning
    
    var backgroundColor: Color {
        switch self {
        case .orange: return .orange50
        case .black: return .gray100
        case .warning: return .red60
        }
    }
    
    var foregroundColor: Color {
        return .white
    }
}

struct CustomButtonView: View {
    let title: String
    let style: CustomButtonStyle
    let action: () -> Void
    
    init(title: String, style: CustomButtonStyle = .black, action: @escaping () -> Void = {}) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.customFont(size: 16, weight: .semibold))
                .foregroundColor(style.foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(style.backgroundColor)
                .cornerRadius(20)
        }
        .accessibilityLabel(title)
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomButtonView(title: "삭제하기", style: .warning) {
        print("Warning button tapped")
    }
}
