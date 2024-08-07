//
//  Routine.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Routine: Codable {
    let routineId, value, routineSet: Int

    enum CodingKeys: String, CodingKey {
        case routineId = "routine_id"
        case value
        case routineSet = "set"
    }
}

typealias RoutineResponse = [Routine]
