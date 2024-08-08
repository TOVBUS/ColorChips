//
//  ExerciseItem.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import Foundation

struct ExerciseItem: Identifiable {
    let id = UUID()
    let name: String
    let value: Int
    let set: Int
    var isFinished: Bool
    var isStarted: Bool
}

var exercises: [ExerciseItem] = [ExerciseItem(name: ExerciseType.overheadClap.rawValue, value: 5, set: 1, isFinished: false, isStarted: true)]
