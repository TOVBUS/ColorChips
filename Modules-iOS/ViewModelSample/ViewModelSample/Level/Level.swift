//
//  Level.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import Foundation

// MARK: - Level
struct Level: Codable {
    let levelID: Int
    let schoolName: String
    let grade: Int

    enum CodingKeys: String, CodingKey {
        case levelID = "level_id"
        case schoolName = "school_name"
        case grade
    }
}
