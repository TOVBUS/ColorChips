//
//  TimerView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: ExerciseTimerViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(viewModel.timeString())
                .font(.customFont(size: 80, weight: .medium, language: .english))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .background(.timerBackgroundDefalt)
                .cornerRadius(50)

            HStack {
                TimerButton(text: "-5s", isPressed: $viewModel.isMinusPressed) {
                    viewModel.decreaseTime()
                }

                TimerButton(text: "+5s", isPressed: $viewModel.isPlusPressed) {
                    viewModel.increaseTime()
                }
            }
        }
        .frame(width: 260, height: 253)
    }
}

#Preview {
    TimerView(viewModel: ExerciseTimerViewModel())
}
