//
//  View+Extension.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/15/24.
//

import SwiftUI

enum AppButtonStyle {
    case primary, secondary, tertiary
}

extension View {
    func appButton(
        style: AppButtonStyle = .primary,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            self
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(backgroundForStyle(style))
                .foregroundColor(foregroundForStyle(style))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColorForStyle(style), lineWidth: 1)
                )
        }
        .font(.body())
    }
    
    private func backgroundForStyle(_ style: AppButtonStyle) -> Color {
        switch style {
        case .primary:
            return .brandPrimary
        case .secondary:
            return .white
        case .tertiary:
            return .clear
        }
    }
    
    private func foregroundForStyle(_ style: AppButtonStyle) -> Color {
        switch style {
        case .primary:
            return .white
        case .secondary, .tertiary:
            return .brandPrimary
        }
    }
    
    private func borderColorForStyle(_ style: AppButtonStyle) -> Color {
        switch style {
        case .primary:
            return .clear
        case .secondary:
            return .brandPrimary
        case .tertiary:
            return .clear
        }
    }
    
    func appAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button? = nil
    ) -> some View {
        alert(isPresented: isPresented) {
            if let secondaryButton = secondaryButton {
                Alert(
                    title: Text(title).font(.subheader()),
                    message: Text(message).font(.body()),
                    primaryButton: primaryButton,
                    secondaryButton: secondaryButton
                )
            } else {
                Alert(
                    title: Text(title).font(.subheader()),
                    message: Text(message).font(.body()),
                    dismissButton: primaryButton
                )
            }
        }
    }
}
