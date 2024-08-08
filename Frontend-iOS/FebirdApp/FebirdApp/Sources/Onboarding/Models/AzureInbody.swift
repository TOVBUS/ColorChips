//
//  AzureInbody.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import Foundation

struct AzureInbody: Codable {
    let weight: String
    let bmr: String
    let bmi: String
    let bodyFat: String
    let inbodyDate: String
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
