//
//  TrendAnalysisView.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import SwiftUI

struct TrendAnalysisView: View {
    let trendMessage: String

    var body: some View {
        Text(trendMessage)
            .font(.customFont(size: 12, weight: .semibold))
            .foregroundStyle(.orange)
            .multilineTextAlignment(.center)
    }
}
