//
//  Routine.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import Foundation

// MARK: - RoutineResponseElement
struct Routine: Codable {
    let routineID, value, routineResponseSet: Int

    enum CodingKeys: String, CodingKey {
        case routineID = "routine_id"
        case value
        case routineResponseSet = "set"
    }
}

typealias RoutineResponse = [Routine]
