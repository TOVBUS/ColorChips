//
//  History.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct History: Codable {
    let historyID: Int
    let achievementDate: String

    enum CodingKeys: String, CodingKey {
        case historyID = "history_id"
        case achievementDate = "achievement_date"
    }
}

struct CreateHistoryDto: Codable {
    let achievementDate: Date

    enum CodingKeys: String, CodingKey {
        case achievementDate = "achievement_date"
    }
}

struct HistoryResponse: Codable {
    let achievementDate: Date?
    let member: Member?
    let level: Level?
    let historyID: Int?

    enum CodingKeys: String, CodingKey {
        case achievementDate = "achievement_date"
        case member, level
        case historyID = "history_id"
    }
}
