//
//  a.swift
//  FebirdApp
//
//  Created by 이유경 on 8/13/24.
//

import Foundation

struct Weights: Codable {
    let content: String
}

struct Bmr: Codable {
    let content: String
}

struct Bmi: Codable {
    let content: String
}

struct BodyFat: Codable {
    let content: String
}

struct InbodyDate: Codable {
    let content: String
}

struct AzureInbody: Codable {
    let weight: Weights
    let bmr: Bmr
    let bmi: Bmi
    let bodyFat: BodyFat
    let inbodyDate: InbodyDate
}

struct Documents: Codable {
    let fields: AzureInbody
}

struct AnalyzeResult: Codable {
    let documents: [Documents]
}

struct InbodyRoot: Codable {
    let status: String
    let analyzeResult: AnalyzeResult?
}
