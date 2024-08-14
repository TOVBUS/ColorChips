//
//  Inbody.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Inbody: Codable {
    var inbodyId: Int
    var height: Float
    var weight: Float
    var inbodyDate: Date
    var bmr: Float?
    var bodyfat: Float?
    var bmi: Float?

    enum CodingKeys: String, CodingKey {
        case inbodyId = "inbody_id", height, weight, inbodyDate = "inbody_date", bmr, bodyfat, bmi
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        inbodyId = try container.decode(Int.self, forKey: .inbodyId)
        height = try container.decode(Float.self, forKey: .height)
        weight = try container.decode(Float.self, forKey: .weight)
        let dateString = try container.decode(String.self, forKey: .inbodyDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .inbodyDate, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        inbodyDate = date
        bmr = try container.decodeIfPresent(Float.self, forKey: .bmr)
        bodyfat = try container.decodeIfPresent(Float.self, forKey: .bodyfat)
        bmi = try container.decodeIfPresent(Float.self, forKey: .bmi)
    }
}

struct CreateInbodyDto: Codable {
    let height: Float
    let weight: Float
    let inbodyDate: String
    let bmr: Float?
    let bodyfat: Double?
    let bmi: Double?
    let memberID: Int

    enum CodingKeys: String, CodingKey {
        case height, weight
        case inbodyDate = "inbody_date"
        case bmr, bodyfat, bmi
        case memberID = "member_id"
    }
}

struct InbodyResponse: Codable {
    let height: Float
    let weight: Float
    let inbodyDate: String
    let bmr: Float?
    let bodyfat: Float?
    let bmi: Float?
    let member: Member?
    let inbodyID: Int?

    enum CodingKeys: String, CodingKey {
        case height, weight
        case inbodyDate = "inbody_date"
        case bmr, bodyfat, bmi, member
        case inbodyID = "inbody_id"
    }
}
