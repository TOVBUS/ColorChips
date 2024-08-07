//
//  Member.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import Foundation

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

// MARK: - Member Apple ID
struct MemberCreateWithAppleID: Codable {
    let appleID: String?
}
