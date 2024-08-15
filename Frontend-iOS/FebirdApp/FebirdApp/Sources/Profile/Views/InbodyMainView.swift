//
//  InbodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct InbodyMainView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @EnvironmentObject var inbodyViewModel: InbodyViewModel
    @State private var isShowModal = false

    var body: some View {
        VStack {
            ScrollView {
                InbodyChartView(inbodys: inbodyViewModel.inbodies, title: "체중", xAxisTitle: "날짜", yAxisTitle: "체중", color: .red) { $0.weight }
                InbodyChartView(inbodys: inbodyViewModel.inbodies, title: "기초 대사량", xAxisTitle: "날짜", yAxisTitle: "기초 대사량", color: .orange) { $0.bmr }
                InbodyChartView(inbodys: inbodyViewModel.inbodies, title: "체지방량", xAxisTitle: "날짜", yAxisTitle: "체지방량", color: .green) { $0.bodyfat }
                InbodyChartView(inbodys: inbodyViewModel.inbodies, title: "BMI", xAxisTitle: "날짜", yAxisTitle: "BMI", color: .blue) { $0.bmi }
            }

            CustomButtonView(title: "인바디 추가하기", style: .black) {
                isShowModal = true
            }
            .sheet(isPresented: $isShowModal, content: {
                InbodyInputSelectView(isPresented: $isShowModal)
            })
        }
        .ignoresSafeArea()
        .preferredColorScheme(.light)
        .onAppear {
            Task {
                await inbodyViewModel.findAllInbodies(memberId: 27)
            }
        }
    }
}
