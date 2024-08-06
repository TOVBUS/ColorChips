//
//  MemberModel.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import Foundation

struct CreateMemberDto: Codable {
    var nickname: String
    var profile_image: String
    var age: Int
    var gender: String
    var appleID: String?
    var kakaoID: String?
    var current_level: Int
}

struct Member: Codable, Identifiable {
    var id: Int?
    var nickname: String
    var profileImage: String
    var age: Int
    var gender: String
    var appleID: String?
    var kakaoID: String?
    var currentLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "member_id"
        case nickname
        case profileImage = "profile_image"
        case age
        case gender
        case appleID
        case kakaoID
        case currentLevel = "current_level"
    }
}
//
//struct MemberCreate: Codable {
//    var id: Int // 필요한값..
//    var nickname: String
//    var profileImage: String
//    var age: Int
//    var gender: String
//    var appleID: String?
//    var kakaoID: String?
//    var currentLevel: Int = 1
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "member_id"
//        case nickname
//        case profileImage = "profile_image"
//        case age
//        case gender
//        case appleID
//        case kakaoID
//        case currentLevel = "current_level"
//    }
//}
//
//extension MemberCreate {
//    func toMember(id: Int) -> Member {
//        return Member(
//            id: id,
//            nickname: self.nickname,
//            profileImage: self.profileImage,
//            age: self.age,
//            gender: self.gender,
//            appleID: self.appleID,
//            kakaoID: self.kakaoID,
//            currentLevel: self.currentLevel
//        )
//    }
//}
