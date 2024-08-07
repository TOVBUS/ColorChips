//
//  DailyMemo.swift
//  FebirdApp
//
//  Created by 이유경 on 8/7/24.
//

import Foundation
import SwiftData

@Model
final class DailyMemo {
    var date: Date
    @Relationship(deleteRule: .cascade) var breakfastMemo: MealMemo?
    @Relationship(deleteRule: .cascade) var lunchMemo: MealMemo?
    @Relationship(deleteRule: .cascade) var dinnerMemo: MealMemo?

    init(date: Date) {
        self.date = date
    }
}
