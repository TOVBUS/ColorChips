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
    @Published var isTimerRunning = false
    private var timer: Timer?

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

    func startTimer(completion: @escaping () -> Void) {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timerSeconds > 0 {
                self.timerSeconds -= 1
            } else {
                self.stopTimer()
                completion()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }

    deinit {
        stopTimer()
    }
}
