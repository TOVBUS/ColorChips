//
//  ExerciseTimerViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI
import Combine

class ExerciseTimerViewModel: ObservableObject {
    @Published var timerSeconds: Int
    @Published var isMinusPressed = false
    @Published var isPlusPressed = false

    init(initialSeconds: Int = 10) {
        self.timerSeconds = initialSeconds
    }

    func decreaseTime() {
        if timerSeconds > 5 {
            timerSeconds -= 5
        }
    }

    func increaseTime() {
        timerSeconds += 5
    }

    func timeString() -> String {
        let minutes = timerSeconds / 60
        let remainingSeconds = timerSeconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
