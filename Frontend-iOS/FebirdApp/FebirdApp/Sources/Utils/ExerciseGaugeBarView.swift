//
//  ExerciseGaugeBarView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/18/24.
//

import SwiftUI

struct ExerciseGaugeBarView: View {
    @Binding var progress: CGFloat // 0.0 to 1.0
    let totalSteps: Int

    private let barWidth: CGFloat = 300
    private let barHeight: CGFloat = 8
    private let indicatorSize: CGFloat = 24

    private var stepWidth: CGFloat {
        barWidth / CGFloat(totalSteps - 1)
    }

    private var currentStep: Int {
        min(max(Int(progress * CGFloat(totalSteps - 1)) + 1, 1), totalSteps)
    }

    private func xPosition(for step: Int) -> CGFloat {
        CGFloat(step - 1) * stepWidth
    }

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .leading) {
                // Background bar
                Rectangle()
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    .frame(width: barWidth, height: barHeight)
                    .cornerRadius(3)

                // Progress bar
                Rectangle()
                    .foregroundColor(Color(red: 0.98, green: 0.45, blue: 0.09))
                    .frame(width: xPosition(for: currentStep), height: barHeight)
                    .cornerRadius(3)

                // Gradient overlay
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.45, blue: 0.09).opacity(0), Color(red: 0.98, green: 0.45, blue: 0.09)]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 70, height: indicatorSize)
                    .cornerRadius(6)
                    .opacity(0.32)
                    .offset(x: xPosition(for: currentStep) - (70 / 2) - (indicatorSize * 1.5))

                // Indicator
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: indicatorSize, height: indicatorSize)
                        .cornerRadius(6)

                    Rectangle()
                        .foregroundColor(.orange50)
                        .frame(width: indicatorSize - 6, height: indicatorSize - 6)
                        .cornerRadius(4)
                }
                .offset(x: xPosition(for: currentStep) - (indicatorSize / 2))
            }
            .frame(width: barWidth, height: indicatorSize)

            // Step indicators
            HStack(spacing: 0) {
                ForEach(1...totalSteps, id: \.self) { step in
                    Text("\(step)")
                        .font(.customFont(size: 16, weight: .regular, language: .english))
                        .fontWeight(currentStep == step ? .bold : .medium)
                        .foregroundColor(.white)
                        .frame(width: step == 1 || step == totalSteps ? indicatorSize : stepWidth, alignment: step == 1 ? .leading : (step == totalSteps ? .trailing : .center))
                }
            }
            .frame(width: barWidth, height: 18)
        }
        .frame(width: barWidth, height: 46)
    }
}

#Preview {
    ExerciseGaugeBarView(progress: .constant(0.5), totalSteps: 3)
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
}
