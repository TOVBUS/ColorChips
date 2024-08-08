//
//  UserProfile.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/4/24.
//

import SwiftUI
import SwiftData

@Model
class UserProfile {
    var id: UUID
    var nickname: String
    var age: Int
    var gender: Gender
    var createdAt: Date
    var updatedAt: Date

    enum Gender: String, Codable {
        case male = "남성"
        case female = "여성"
    }

    init(id: UUID = UUID(), nickname: String, age: Int, gender: Gender) {
        self.id = id
        self.nickname = nickname
        self.age = age
        self.gender = gender
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
