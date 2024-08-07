//
//  Inbody.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import Foundation

//struct Inbody: Codable {
//    var inbody_id: Int
//    var height: Float
//    var weight: Float
//    var inbody_date: Date
//    var bmr: Float?
//    var bodyFat: Float?
//    var bmi: Float?
//    
//    enum CodingKeys: String, CodingKey {
//        case inbody_id, height, weight, inbody_date, bmr, bodyFat = "bodyfat", bmi
//    }
//}

struct Inbody: Codable {
    var inbody_id: Int
    var height: Float
    var weight: Float
    var inbody_date: Date
    var bmr: Float?
    var bodyFat: Float?
    var bmi: Float?
    
    enum CodingKeys: String, CodingKey {
        case inbody_id, height, weight, inbody_date, bmr, bodyFat = "bodyfat", bmi
    }

    // Custom decoding to handle date string
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        inbody_id = try container.decode(Int.self, forKey: .inbody_id)
        height = try container.decode(Float.self, forKey: .height)
        weight = try container.decode(Float.self, forKey: .weight)
        let dateString = try container.decode(String.self, forKey: .inbody_date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .inbody_date, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        inbody_date = date
        bmr = try container.decodeIfPresent(Float.self, forKey: .bmr)
        bodyFat = try container.decodeIfPresent(Float.self, forKey: .bodyFat)
        bmi = try container.decodeIfPresent(Float.self, forKey: .bmi)
    }
}

// MARK: - CreateInbodyDto
struct CreateInbodyDto: Codable {
    let height: Float
    let weight: Float
    let inbodyDate: Date
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

// MARK: - InbodyResponse
struct InbodyResponse: Codable {
    let height: String?
    let weight: String?
    let inbodyDate: String?
    let bmr: String?
    let bodyfat: String?
    let bmi: String?
    let member: Member?
    let inbodyID: Int?

    enum CodingKeys: String, CodingKey {
        case height, weight
        case inbodyDate = "inbody_date"
        case bmr, bodyfat, bmi, member
        case inbodyID = "inbody_id"
    }
}

// MARK: - Member
struct Member: Codable {
    let id: Int
    let age: Int?
    let nickname, profileImage, gender: String?
    let appleID: String?
    let kakaoID: String?
    let currentLevel: Int

    enum CodingKeys: String, CodingKey {
        case id = "member_id"
        case nickname
        case profileImage = "profile_image"
        case age, gender, appleID, kakaoID
        case currentLevel = "current_level"
    }
}
