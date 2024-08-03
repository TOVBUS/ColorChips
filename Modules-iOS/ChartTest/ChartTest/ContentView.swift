//
//  ContentView.swift
//  ChartTest
//
//  Created by 김혜수 on 7/30/24.
//

import SwiftUI
import Charts

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}()

struct InbodyModel {
    var height: Float
    var weight: Float
    var inbodyDate: Date
    var bmr: Float?
    var bodyfat: Float?
    var bmi: Float?
}

let inbodyDummyData: [InbodyModel] = [
    InbodyModel(height: 175.5, weight: 70.2, inbodyDate: dateFormatter.date(from: "2023-01-01T00:00:00+0000")!, bmr: 1620.5, bodyfat: 18.3, bmi: 22.8),
    InbodyModel(height: 175.5, weight: 55.5, inbodyDate: dateFormatter.date(from: "2023-02-01T00:00:00+0000")!, bmr: 1625.0, bodyfat: 18.1, bmi: 22.9),
    InbodyModel(height: 175.5, weight: 71.0, inbodyDate: dateFormatter.date(from: "2023-03-01T00:00:00+0000")!, bmr: nil, bodyfat: 18.5, bmi: 23.1),
    InbodyModel(height: 175.5, weight: 67.8, inbodyDate: dateFormatter.date(from: "2023-04-01T00:00:00+0000")!, bmr: 1630.2, bodyfat: nil, bmi: 23.0),
    InbodyModel(height: 175.5, weight: 70.3, inbodyDate: dateFormatter.date(from: "2023-05-01T00:00:00+0000")!, bmr: 1622.8, bodyfat: 17.9, bmi: nil),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: dateFormatter.date(from: "2023-06-01T00:00:00+0000")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: dateFormatter.date(from: "2023-07-01T00:00:00+0000")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 80.5, inbodyDate: dateFormatter.date(from: "2023-08-01T00:00:00+0000")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2),
    InbodyModel(height: 175.5, weight: 70.5, inbodyDate: dateFormatter.date(from: "2023-09-01T00:00:00+0000")!, bmr: 1639.2, bodyfat: 18.7, bmi: 23.2)
]

struct InbodyChartView<T: Plottable & BinaryFloatingPoint>: View {
    let inbodys: [InbodyModel]
    let title: String
    let xAxisTitle: String
    let yAxisTitle: String
    let color: Color
    let getValue: (InbodyModel) -> T?

    private var sortedInbodys: [InbodyModel] {
        return inbodys.sorted{ $0.inbodyDate < $1.inbodyDate}
    }

    private var filteredInbodys: [InbodyModel] {
        return sortedInbodys.filter{ getValue($0) != nil }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }

    private var minValue: T {
        let values = inbodys.compactMap(getValue)
        return values.min().map { $0 * T(0.8) } ?? T.zero
    }

    private var maxValue: T {
        let values = inbodys.compactMap(getValue)
        return values.max().map { $0 * T(1.2) } ?? T.zero
    }

    private func xPosition(for date: Date, in geometry: GeometryProxy) -> CGFloat {
        let startDate = filteredInbodys.first!.inbodyDate
        let endDate = filteredInbodys.last!.inbodyDate.addingTimeInterval(2000000)
        let totalDuration = endDate.timeIntervalSince(startDate)
        let currentDuration = date.timeIntervalSince(startDate)
        return geometry.size.width * CGFloat(currentDuration / totalDuration)
    }

    private func yPosition(for value: T, in geometry: GeometryProxy) -> CGFloat {
        let range = maxValue - minValue
        let normalizedValue = (value - minValue) / range
        return geometry.size.height * (1 - CGFloat(normalizedValue))
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .padding(.leading, 25)
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    Chart {
                        ForEach(filteredInbodys, id: \.inbodyDate) { inbody in
                            if let value = getValue(inbody) {
                                LineMark(
                                    x: .value(xAxisTitle, inbody.inbodyDate),
                                    y: .value(yAxisTitle, value)
                                )
                                .foregroundStyle(color)

                                PointMark(
                                    x: .value(xAxisTitle, inbody.inbodyDate),
                                    y: .value(yAxisTitle, value)
                                )
                                .foregroundStyle(color)
                            }
                        }
                    }
                    .frame(width: max(UIScreen.main.bounds.width - 120, CGFloat(filteredInbodys.count * 70)))
                    .padding(.horizontal, 18)
                    .chartXAxis {
                        AxisMarks(values: filteredInbodys.map { $0.inbodyDate }) { value in
                            if let date = value.as(Date.self) {
                                AxisValueLabel {
                                    Text(dateFormatter.string(from: date))
                                        .font(.caption)
                                }
                            }
                            AxisTick()
                            AxisGridLine()
                        }
                    }
                    .id(filteredInbodys.last!.inbodyDate)
                    .chartXScale(domain: filteredInbodys.first!.inbodyDate...filteredInbodys.last!.inbodyDate.addingTimeInterval(2000000))
                    .chartYScale(domain: minValue...maxValue)
                    .onAppear(perform: {
                        withAnimation {
                            proxy.scrollTo(filteredInbodys.last!.inbodyDate, anchor: .trailing)
                        }
                    })
                    .overlay(
                        GeometryReader { geometry in
                            ForEach(filteredInbodys, id: \.inbodyDate) { inbody in
                                if let value = getValue(inbody) {
                                    Text(String(format: "%.1f", Double(value)))
                                        .font(.caption)
                                        .foregroundStyle(Color.gray)
                                        .position(
                                            x: xPosition(for: inbody.inbodyDate, in: geometry),
                                            y: yPosition(for: value, in: geometry)
                                        )
                                        .offset(y: -25)
                                }
                            }
                        }
                    )
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 18)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.gray.opacity(0.1))
            )
            .padding(25)
        }
    }
}

struct InbodyMainView: View {
    let inbodys: [InbodyModel]

    var body: some View {
        VStack {

            // TO-DO : ProfileHeaderView

            ScrollView {
                InbodyChartView(inbodys: inbodys, title: "체중", xAxisTitle: "날짜", yAxisTitle: "체중", color: .red) { $0.weight }
                InbodyChartView(inbodys: inbodys, title: "기초 대사량", xAxisTitle: "날짜", yAxisTitle: "기초 대사량", color: .orange) { $0.bmr }
                InbodyChartView(inbodys: inbodys, title: "체지방량", xAxisTitle: "날짜", yAxisTitle: "체지방량", color: .green) { $0.bodyfat }
                InbodyChartView(inbodys: inbodys, title: "BMI", xAxisTitle: "날짜", yAxisTitle: "BMI", color: .blue) { $0.bmi }

            }
        }
    }
}

#Preview {
    InbodyMainView(inbodys: inbodyDummyData)
}
