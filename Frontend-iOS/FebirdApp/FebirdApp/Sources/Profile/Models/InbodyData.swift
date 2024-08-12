//
//  InbodyData.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import Foundation

struct InbodyModel {
    var height: Float
    var weight: Float
    var inbodyDate: Date
    var bmr: Float?
    var bodyfat: Float?
    var bmi: Float?

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}

let inbodyDummyData: [InbodyModel] = [
    InbodyModel(height: 175.5, weight: 70.2, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-01-01")!, bmr: 1620.5, bodyfat: 18.3, bmi: 22.8),
    InbodyModel(height: 175.5, weight: 55.5, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-02-01")!, bmr: 1625.0, bodyfat: 18.1, bmi: 22.9),
    InbodyModel(height: 175.5, weight: 71.0, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-03-01")!, bmr: nil, bodyfat: 18.5, bmi: 23.1),
    InbodyModel(height: 175.5, weight: 67.8, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-04-01")!, bmr: 1630.2, bodyfat: nil, bmi: 23.0),
    InbodyModel(height: 175.5, weight: 70.3, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-05-01")!, bmr: 1622.8, bodyfat: 17.9, bmi: nil),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-06-01")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-07-01")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-08-01")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 70.5, inbodyDate: InbodyModel.dateFormatter.date(from: "2023-09-01")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2)
]
