//
//  MemoModel.swift
//  FebirdApp
//
//  Created by 이유경 on 8/6/24.
//

import Foundation
import SwiftData

enum MealType: String, Codable {
    case breakfast
    case launch
    case dinner
}

@Model
final class DailyMemo {
    var date: Date
    var breakfastMemo: MealMemo?
    var lunchMemo: MealMemo?
    var dinnerMemo: MealMemo?
    
    init(date: Date) {
        self.date = date
    }
}

@Model
final class MealMemo {
    var mealType: MealType
    var image: Data?
    var title: String?
    var content: String?
    
    @Relationship(inverse: \DailyMemo.breakfastMemo) var breakfastFor: DailyMemo?
    @Relationship(inverse: \DailyMemo.lunchMemo) var lunchFor: DailyMemo?
    @Relationship(inverse: \DailyMemo.dinnerMemo) var dinnerFor: DailyMemo?
    
    init(mealType: MealType, image: Data? = nil, title: String? = nil, content: String? = nil, breakfastFor: DailyMemo? = nil, lunchFor: DailyMemo? = nil, dinnerFor: DailyMemo? = nil) {
        self.mealType = mealType
        self.image = image
        self.title = title
        self.content = content
        self.breakfastFor = breakfastFor
        self.lunchFor = lunchFor
        self.dinnerFor = dinnerFor
    }
}
