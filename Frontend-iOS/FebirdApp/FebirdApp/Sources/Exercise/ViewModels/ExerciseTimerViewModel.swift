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
        self.timerSeconds = initialSeconds // 초기 타이머 설정
    }

    /// 시간을 감소시킵니다.
    func decreaseTime() {
        if timerSeconds > 5 {
            timerSeconds -= 5 // 최소 5초로 유지
        }
    }

    /// 시간을 증가시킵니다.
    func increaseTime() {
        timerSeconds += 5 // 5초 증가
    }

    /// 시간을 문자열 형태로 변환합니다.
    func timeString() -> String {
        let minutes = timerSeconds / 60
        let remainingSeconds = timerSeconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds) // "MM:SS" 형식
    }

    /// 타이머를 시작합니다.
    func startTimer(completion: @escaping () -> Void) {
        isTimerRunning = true // 타이머 실행 중 설정
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timerSeconds > 0 {
                self.timerSeconds -= 1 // 1초마다 감소
            } else {
                self.stopTimer() // 타이머 중지
                completion() // 완료 핸들러 호출
            }
        }
    }

    /// 타이머를 중지합니다.
    func stopTimer() {
        timer?.invalidate() // 타이머 무효화
        timer = nil
        isTimerRunning = false // 타이머 실행 중 설정 해제
    }

    deinit {
        stopTimer() // 메모리 해제 시 타이머 중지
    }
}
