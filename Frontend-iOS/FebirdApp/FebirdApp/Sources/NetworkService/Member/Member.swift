//
//  Member.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Member: Codable {
    var id: Int
    var age: Int?
    var nickname, profileImage, gender: String?
    var appleID: String?
    var kakaoID: String?
    var currentLevel: Int

    enum CodingKeys: String, CodingKey {
        case id = "member_id"
        case nickname
        case profileImage = "profile_image"
        case age, gender, appleID, kakaoID
        case currentLevel = "current_level"
    }
}

struct MemberCreateWithAppleID: Codable {
    let appleID: String?
}

struct MemberIDFromAppleID: Codable {
    let memberID: Int

    enum CodingKeys: String, CodingKey {
        case memberID = "member_id"
    }
}
