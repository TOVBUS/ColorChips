//
//  Member.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

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

struct MemberCreateWithAppleID: Codable {
    let appleID: String?
}

struct MemberIDFromAppleID: Codable {
    let memberID: Int

    enum CodingKeys: String, CodingKey {
        case memberID = "member_id"
    }
}
