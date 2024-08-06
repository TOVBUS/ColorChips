//
//  LevelRecordData.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/6/24.
//

import SwiftUI
import SwiftData

@Model
class LevelRecordData {
    var routineId: Int // 1001 운동
    var levelId: Int // 1 => day1
    var schoolName: String // 유치원
    var grade: Int // 1 => 씨앗반
    var imageData: Data? // 이미지
    var savedDate: String // 찍은 날짜

    init(routineId: Int, levelId: Int, schoolName: String, grade: Int, imageData: UIImage) {
        self.routineId = routineId
        self.levelId = levelId
        self.schoolName = schoolName
        self.grade = grade
        self.imageData = imageData.pngData()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.savedDate = dateFormatter.string(from: Date())
    }
}
