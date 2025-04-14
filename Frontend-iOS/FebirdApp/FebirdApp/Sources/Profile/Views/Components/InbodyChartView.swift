//
//  InbodyChartView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI
import Charts

struct InbodyChartView<T: Plottable & BinaryFloatingPoint>: View {
    let inbodys: [Inbody]
    let title: String
    let xAxisTitle: String
    let yAxisTitle: String
    let color: Color
    let getValue: (Inbody) -> T?

    @StateObject private var inbodyViewModel = InbodyViewModel()

    private var sortedInbodys: [Inbody] {
        return inbodys.sorted { $0.inbodyDate < $1.inbodyDate}
    }

    private var filteredInbodys: [Inbody] {
        return sortedInbodys.filter { getValue($0) != nil }
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
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.leading, 25)
                Spacer()
            }
            .padding(.bottom, 20)

            if filteredInbodys.isEmpty {
                Image("EmptyChart")
                    .padding(.bottom, 50)
            } else {

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
                                            .foregroundStyle(.gray.opacity(0.6))
                                    }
                                }
                                AxisTick()
                                    .foregroundStyle(.gray.opacity(0.6))
                                AxisGridLine()
                                    .foregroundStyle(.gray.opacity(0.6))
                            }
                        }
                        .chartYAxis {
                            AxisMarks { value in
                                AxisGridLine()
                                    .foregroundStyle(.gray.opacity(0.6))
                                AxisTick()
                                    .foregroundStyle(.gray.opacity(0.6))
                                AxisValueLabel {
                                    Text(value.as(T.self).map { String(format: "%.1f", Double($0)) } ?? "")
                                        .font(.caption)
                                        .foregroundStyle(.gray.opacity(0.6))
                                }
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
                                            .foregroundStyle(.gray)
                                            .position(
                                                x: xPosition(for: inbody.inbodyDate, in: geometry),
                                                y: yPosition(for: value, in: geometry)
                                            )
                                            .offset(x: -10)
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
                .padding(.horizontal, 25)

                TrendAnalysisView(trendMessage: inbodyViewModel.analyzeTrend(for: filteredInbodys, getValue: getValue))
                    .padding(.bottom, 50)
                    .padding(.top, 15)
                    .padding(.horizontal, 20)
            }
        }
    }
}
