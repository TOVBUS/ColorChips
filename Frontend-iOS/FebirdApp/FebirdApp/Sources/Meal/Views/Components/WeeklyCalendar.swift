//
//  WeeklyCalendar.swift
//  FebirdApp
//
//  Created by 이유경 on 7/20/24.
//

import SwiftUI

struct WeeklyCalendar: View {
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    private let today = Date()

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            monthView
                .foregroundStyle(.white)
                .padding(.bottom, 40)

            ZStack {
                dayView
                blurView
            }
            .frame(height: 30)
            .padding(.horizontal, 24)
            .padding(.top, -40)
        }
    }

    // MARK: - 월 표시 뷰
    private var monthView: some View {
        HStack(alignment: .center, spacing: 12) {
            Button(
                action: {
                    changeMonth(-1)
                },
                label: {
                    Image("leftIcon")
                        .padding()
                }
            )
            Spacer()

            Text(monthTitle(from: selectedDate))
                .font(.customFont(size: 18, weight: .medium))

            Spacer()

            Button(
                action: {
                    changeMonth(1)
                },
                label: {
                    Image("rightIcon")
                        .padding()
                }
            )
        }
        .frame(width: 343, alignment: .center)
        .padding(.bottom, 12)
    }
    // MARK: - 일자 표시 뷰
    @ViewBuilder
    private var dayView: some View {
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                let components = (
                    0..<calendar.range(of: .day, in: .month, for: startDate)!.count)
                    .map {
                        calendar.date(byAdding: .day, value: $0, to: startDate)!
                    }
                ForEach(components, id: \.self) { date in
                    VStack {
                        Text(day(from: date))
                            .foregroundStyle(.gray30)
                            .font(.customFont(size: 12, weight: .medium))

                        Text("\(calendar.component(.day, from: date))")
                            .foregroundStyle(.white)
                            .font(.customFont(size: 20, weight: .bold))
                    }
                    .frame(width: 30, height: 60)
                    .padding(.horizontal,8)
                    .padding(.vertical, 3)
                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .orange50 : .gray60)
                    .cornerRadius(16)
                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
        .padding(.bottom, 12)
    }

    // MARK: - 가장자리 블러 뷰
    private var blurView: some View {
        HStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .gray100.opacity(1),
                        .gray100.opacity(0)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 40)
            .edgesIgnoringSafeArea(.leading)

            Spacer()

            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .gray100.opacity(1),
                        .gray100.opacity(0)
                    ]
                ),
                startPoint: .trailing,
                endPoint: .leading
            )
            .frame(width: 40)
            .edgesIgnoringSafeArea(.trailing)
        }
        .padding(.bottom, 12)
    }
}

// MARK: - 로직
private extension WeeklyCalendar {
    // 월 표시
    func monthTitle(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월"
        return dateFormatter.string(from: date)
    }
    // 월 변경
    func changeMonth(_ value: Int) {
        guard let date = calendar.date(
            byAdding: .month,
            value: value,
            to: selectedDate
        ) else {
            return
        }
        selectedDate = date
    }
    // 요일 추출
    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        return dateFormatter.string(from: date)
    }
}

#Preview {
    WeeklyCalendar(selectedDate: .constant(Date()))
}
