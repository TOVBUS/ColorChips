//
//  InbodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct InbodyMainView: View {
    let inbodys: [InbodyModel]

    var body: some View {
        VStack {
            ScrollView {
                InbodyChartView(inbodys: inbodys, title: "체중", xAxisTitle: "날짜", yAxisTitle: "체중", color: .red) { $0.weight }
                InbodyChartView(inbodys: inbodys, title: "기초 대사량", xAxisTitle: "날짜", yAxisTitle: "기초 대사량", color: .orange) { $0.bmr }
                InbodyChartView(inbodys: inbodys, title: "체지방량", xAxisTitle: "날짜", yAxisTitle: "체지방량", color: .green) { $0.bodyfat }
                InbodyChartView(inbodys: inbodys, title: "BMI", xAxisTitle: "날짜", yAxisTitle: "BMI", color: .blue) { $0.bmi }
            }

            Button(action: {
                // TODO: 스마트 체중계 결과 화면 추가
                // TODO: 스마트 체중계 결과 이미지로 변경
            }, label: {
                Text("인바디 추가하기")
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.light)
    }
}

#Preview {
    InbodyMainView(inbodys: inbodyDummyData)
}
