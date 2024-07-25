//
//  MealRecomandation.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import Foundation

struct MealRecommendation: Codable, Identifiable {
    var id = UUID()
    let meals: [String]
    let calories: Int
}
