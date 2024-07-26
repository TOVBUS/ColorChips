//
//  TimerButton.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI

struct TimerButton: View {

    let text: String
    @Binding var isPressed: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.1)) {
                self.isPressed = true
                self.action()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeInOut(duration: 1.5)) {
                    self.isPressed = false
                }
            }
        }) {
            Text(text)
                .font(.customFont(size: 22, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.timerBackgroundDefalt)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.orange, lineWidth: 2)
                        .opacity(isPressed ? 1 : 0)
                )
        }
        .animation(.easeInOut(duration: 0.1), value: isPressed)
    }
}

#Preview {
    TimerButton(text: "+5s", isPressed: .constant(false), action: {})
}
