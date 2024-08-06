//
//  ExerciseState.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import Foundation

enum ClappingState: String {
    case start = "시작 자세"
    case handsUp = "손 올리기"
    case handsDown = "손 내리기"
}

enum DownwardPunchState: String {
    case standing = "서있기"
    case start = "시작 자세"
    case handsUp = "손 올리기"
    case handsDown = "손 내리기"
    case armsExtended = "팔 뻗기"
}

enum SumoSquatState: String {
    case standing = "서있는 상태"
    case goingDown = "내려가는 중"
    case squatting = "스쿼트 자세"
    case goingUp = "올라가는 중"
}
