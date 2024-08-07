//
//  EducationLevel.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/6/24.
//

import SwiftUI
import SwiftData

enum EducationLevel: String, CaseIterable, Codable {
    case kindergarten = "유치원"
    case elementary = "초등학교"
    case middleSchool = "중학교"
    case highSchool = "고등학교"
    case university = "대학교"
}

enum Grade: Int, CaseIterable, Codable {
    case kindergarten1 = 1, kindergarten2, kindergarten3
    case elementary1 = 11, elementary2, elementary3, elementary4, elementary5, elementary6
    case middle1 = 21, middle2, middle3
    case high1 = 31, high2, high3
    case university1 = 41, university2, university3, university4

    func toString(for level: EducationLevel) -> String {
        switch level {
        case .kindergarten:
            switch self {
            case .kindergarten1: return "씨앗반"
            case .kindergarten2: return "새싹반"
            case .kindergarten3: return "열매반"
            default: return "알 수 없음"
            }
        case .elementary, .middleSchool, .highSchool, .university:
            return "\(self.rawValue % 10)학년"
        }
    }

    static func gradesFor(_ level: EducationLevel) -> [Grade] {
        switch level {
        case .kindergarten:
            return [.kindergarten1, .kindergarten2, .kindergarten3]
        case .elementary:
            return [.elementary1, .elementary2, .elementary3, .elementary4, .elementary5, .elementary6]
        case .middleSchool:
            return [.middle1, .middle2, .middle3]
        case .highSchool:
            return [.high1, .high2, .high3]
        case .university:
            return [.university1, .university2, .university3, .university4]
        }
    }
}
