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
    let set: String
    let isFinished: Bool
    let isStarted: Bool
}
