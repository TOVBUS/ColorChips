//
//  InbodyGraphView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI
import Charts

// MARK: - Dummy Data
struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]

struct InbodyGraphView: View {
    @State var title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.gray100)

                Spacer()
            }

            Chart {
                ForEach(data) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                    }
            }
            .padding(.horizontal, 16)
            .frame(height: 200)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(.gray10)
            )
        }
    }
}

#Preview {
    InbodyGraphView(title: "체중")
}
