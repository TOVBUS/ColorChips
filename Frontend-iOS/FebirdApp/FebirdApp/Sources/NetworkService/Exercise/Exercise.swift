//
//  Exercise.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Exercise: Codable {
    let exerciseID: Int
    let exerciseName, videoGuideURL, tip, type: String

    enum CodingKeys: String, CodingKey {
        case exerciseID = "exercise_id"
        case exerciseName = "exercise_name"
        case videoGuideURL = "video_guide_url"
        case tip, type
    }
}

typealias ExerciseResponse = [Exercise]
