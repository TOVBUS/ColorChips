//
//  InbodyViewModel.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import Foundation
import SwiftUI

class InbodyViewModel: ObservableObject {
    func analyzeTrend<T: BinaryFloatingPoint>(for inbodys: [InbodyModel], getValue: (InbodyModel) -> T?) -> String {
        let filteredInbodys = inbodys.filter { getValue($0) != nil }.sorted { $0.inbodyDate < $1.inbodyDate }

        guard filteredInbodys.count >= 2 else {
            return "더 많은 데이터를 넣어주시면 피오가 분석해볼게요🤔"
        }

        let values = filteredInbodys.compactMap(getValue)
        let firstValue = values.first!
        let lastValue = values.last!

        let change = lastValue - firstValue
        let percentChange = (change / firstValue) * T(100)

        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: filteredInbodys.first!.inbodyDate, to: filteredInbodys.last!.inbodyDate).day!

        var trendMessage = ""

        if filteredInbodys.count >= 3 {
            if abs(percentChange) < T(1) {
                trendMessage = "최근 \(days)일 동안 큰 변화가 없으며,"
            } else if percentChange > T(0) {
                trendMessage = "최근 \(days)일 동안 약 \(String(format: "%.1f", abs(Double(percentChange))))% 증가,"
            } else {
                trendMessage = "최근 \(days)일 동안 약 \(String(format: "%.1f", abs(Double(percentChange))))% 감소,"
            }
        }

        if filteredInbodys.count >= 2 {
            let lastTwoValues = values.suffix(2)
            let previousValue = lastTwoValues.first!
            let currentValue = lastTwoValues.last!
            let shortTermChange = currentValue - previousValue
            let shortTermPercentChange = (shortTermChange / previousValue) * T(100)

            var shortTermTrendMessage = ""
            if abs(shortTermPercentChange) < T(0.1) {
                shortTermTrendMessage = "직전 측정 대비 유지."
            } else if shortTermPercentChange > T(0) {
                shortTermTrendMessage = "직전 측정 대비 \(String(format: "%.1f", abs(Double(shortTermPercentChange))))% 증가."
            } else {
                shortTermTrendMessage = "직전 측정 대비 \(String(format: "%.1f", abs(Double(shortTermPercentChange))))% 감소."
            }

            trendMessage += shortTermTrendMessage
        }

        return trendMessage
    }
}
