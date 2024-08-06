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
    case sharing

    var backgroundColor: Color {
        switch self {
        case .orange: return .orange50
        case .black: return .gray100
        case .warning: return .red60
        case .sharing: return .orange40
        }
    }

    var foregroundColor: Color {
        switch self {
        case .orange, .black, .sharing, .warning:
            return .white
        }
    }
}

struct CustomButtonView: View {
    let title: String
    let image: String?
    let style: CustomButtonStyle
    let action: () -> Void

    init(image: String? = nil, title: String, style: CustomButtonStyle = .black, action: @escaping () -> Void = {}) {
        self.title = title
        self.image = image
        self.style = style
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                if image != nil {
                    Image(image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Text(title)
                    .font(.customFont(size: 16, weight: .semibold))
            }
            .foregroundColor(style.foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(style.backgroundColor)
            .cornerRadius(20)
        }
        .accessibilityLabel(title)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomButtonView(image: "cameraButton", title: "kakao Login", style: .orange) {
        print("Warning button tapped")
    }
}
