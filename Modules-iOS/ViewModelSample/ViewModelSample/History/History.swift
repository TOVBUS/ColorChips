//
//  History.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import Foundation

struct History: Codable, Identifiable {
    var id: Int
    var achievementDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "history_id"
        case achievementDate = "achievement_date"
    }
}
