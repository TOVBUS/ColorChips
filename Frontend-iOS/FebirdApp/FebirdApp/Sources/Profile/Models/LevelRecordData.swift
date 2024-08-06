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
    let levelId: Int
    let schoolName: String
    let imageData: Data?
    let savedDate: String

    init(levelId: Int, schoolName: String, imageData: UIImage) {
        self.levelId = levelId
        self.schoolName = schoolName
        self.imageData = imageData.pngData()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.savedDate = dateFormatter.string(from: Date())
    }
}
