//
//  MealMemo.swift
//  FebirdApp
//
//  Created by 이유경 on 8/7/24.
//

import Foundation
import SwiftData

@Model
final class MealMemo {
    var mealType: MealType
    var image: Data?
    var title: String?
    var content: String?

    @Relationship(inverse: \DailyMemo.breakfastMemo) var breakfastFor: DailyMemo?
    @Relationship(inverse: \DailyMemo.lunchMemo) var lunchFor: DailyMemo?
    @Relationship(inverse: \DailyMemo.dinnerMemo) var dinnerFor: DailyMemo?

    init(mealType: MealType, image: Data? = nil, title: String? = nil, content: String? = nil) {
        self.mealType = mealType
        self.image = image
        self.title = title
        self.content = content
    }
}
