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
        VStack {
            Spacer()
            
            Gauge(value: Double(progress), in: Double(minValue)...Double(maxValue), label: {})
                .tint(.orange50)
                .padding(.horizontal, 24)
                .padding(.vertical, 50)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}

#Preview {
    OnboardingGaugeView(progress: 2)
}
