//
//  AlbumData.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import Foundation

struct AlbumData: Identifiable {
    let id = UUID()
    let educationLevel: EducationLevel // 학교 
    let grade: Grade // 학년
    let levelRecords: [LevelRecordData]? // day1, day2에 해당하는 데이터

    var title: String {
        "\(educationLevel.rawValue) \(grade.toString(for: educationLevel)) 시절"
    }

    var hasData: Bool {
        return levelRecords != nil
    }

    var dayCount: Int {
        switch educationLevel {
        case .kindergarten:
            return 3
        case .elementary:
            return 5
        case .middleSchool:
            return 10
        case .highSchool:
            return 14
        case .university:
            return 21
        }
    }
}
