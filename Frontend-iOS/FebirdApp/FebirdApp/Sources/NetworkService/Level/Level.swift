//
//  Level.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Level: Codable {
    let levelId: Int
    let schoolName: String
    let grade: Int

    enum CodingKeys: String, CodingKey {
        case levelId = "level_id"
        case schoolName = "school_name"
        case grade
    }
}
