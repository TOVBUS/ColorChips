//
//  OnboardingGaugeView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingGaugeView: View {
    @State var progress: Int
    var minValue: Int = 0
    var maxValue: Int = 10

    var body: some View {
        Gauge(value: Double(progress), in: Double(minValue)...Double(maxValue), label: {

        })
        .tint(Color.orange)
        .padding(.horizontal, 40)
    }
}

#Preview {
    OnboardingGaugeView(progress: 2)
}
