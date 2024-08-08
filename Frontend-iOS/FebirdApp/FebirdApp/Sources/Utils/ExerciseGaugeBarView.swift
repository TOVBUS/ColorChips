//
//  ExerciseGaugeBarView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/18/24.
//

import SwiftUI

struct ExerciseGaugeBarView: View {
    @Binding var selection: Int
    let range: ClosedRange<Int>

    private let barWidth: CGFloat = 300
    private let barHeight: CGFloat = 8
    private let indicatorSize: CGFloat = 24

    private var totalSteps: Int {
        range.upperBound - range.lowerBound + 1
    }

    private var stepWidth: CGFloat {
        barWidth / CGFloat(totalSteps - 1)
    }

    private func xPosition(for step: Int) -> CGFloat {
        CGFloat(step - range.lowerBound) * stepWidth
    }

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .leading) {
                // Background bar
                Rectangle()
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    .frame(width: barWidth, height: barHeight)
                    .cornerRadius(3)

                Rectangle()
                    .foregroundColor(Color(red: 0.98, green: 0.45, blue: 0.09))
                    .frame(width: xPosition(for: selection), height: barHeight)
                    .cornerRadius(3)

                if selection > range.lowerBound {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.45, blue: 0.09).opacity(0), Color(red: 0.98, green: 0.45, blue: 0.09)]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 70, height: indicatorSize)
                        .cornerRadius(6)
                        .opacity(0.32)
                        .offset(x: xPosition(for: selection) - 70)
                }

                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: indicatorSize, height: indicatorSize)
                        .cornerRadius(6)

                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: indicatorSize - 6, height: indicatorSize - 6)
                        .cornerRadius(4)
                }
                .offset(x: xPosition(for: selection) - (indicatorSize / 2))
            }
            .frame(width: barWidth, height: indicatorSize)

            HStack(spacing: 0) {
                ForEach(range, id: \.self) { step in
                    Text("\(step)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(step <= selection ? .orange : .gray)
                        .frame(width: stepWidth, alignment: .center)
                        .offset(x: step == range.lowerBound ? indicatorSize / 2 : (step == range.upperBound ? -indicatorSize / 2 : 0))
                }
            }
            .frame(width: barWidth, height: 18)
        }
        .frame(width: barWidth, height: 46)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let step = Int(round(value.location.x / stepWidth)) + range.lowerBound
                    selection = max(min(step, range.upperBound), range.lowerBound)
                }
        )
    }
}

#Preview {
    ExerciseGaugeBarView(selection: .constant(3), range: 1...3)
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
}
