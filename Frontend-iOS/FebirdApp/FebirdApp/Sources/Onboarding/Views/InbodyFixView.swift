//
//  InbodyFixView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyFixView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var viewModel: AzureInbodyViewModel
    @EnvironmentObject var inbodyViewModel: InbodyViewModel

    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: String = ""
    @State private var bodyfat: String = ""
    @State private var bmr: String = ""
    @State private var showActionSheet = false

    var body: some View {
        ScrollView {
            OnboardingGaugeView(progress: 4)

            Text("정보가 다르게 인식됐나요? \n여기에서 수정할 수 있어요 😉")
                .font(.customFont(size: 20, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                .padding(.bottom, 46)

            VStack(spacing: 20) {
                OnboardingTextField(question: "체중 *", placeholder: viewModel.weight?.content ?? "45.3", unit: "kg", inputValue: weight, keyboardType: .numberPad, autoFocus: false, text: $weight)
                OnboardingTextField(question: "키 *", placeholder: "160.3", unit: "cm", inputValue: height, keyboardType: .numberPad, autoFocus: false, text: $height)
                OnboardingTextField(question: "BMI", placeholder: viewModel.bmi?.content ?? "17.6", unit: "%", inputValue: bmi, keyboardType: .numberPad, autoFocus: false, text: $bmi)
                OnboardingTextField(question: "체지방량", placeholder: viewModel.bodyFat?.content ?? "9.6", unit: "%", inputValue: bodyfat, keyboardType: .numberPad, autoFocus: false, text: $bodyfat)
                OnboardingTextField(question: "기초대사량", placeholder: viewModel.bmr?.content ?? "kcal", unit: "kg", inputValue: bmr, keyboardType: .numberPad, autoFocus: false, text: $bmr)
            }.padding(.horizontal, 20)

            CustomButtonView(title: "다시찍기") {
                showActionSheet = true
            }
            .padding(.top, 40)

            CustomButtonView(title: "저장하기") {
                saveInbodyData()
                navigationPathFinder.addPath(option: .eyeBodyView)
            }
        }
        .navigationBarBackButtonHidden()
    }

    private func saveInbodyData() {

        guard let weightValue = Float(weight),
              let heightValue = Float(height) else {
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let inbodyDateString = dateFormatter.string(from: Date())

        let createInbodyDto = CreateInbodyDto(
            height: heightValue,
            weight: weightValue,
            inbodyDate: inbodyDateString,
            bmr: Float(bmr),
            bodyfat: Double(bodyfat),
            bmi: Double(bmi),
            memberID: 27)

        Task {
            do {
                let response = try await NetworkManager.createInbody(createInbodyDto: createInbodyDto)
                await MainActor.run {
                    inbodyViewModel.createdInbody = response
                }
            } catch {
                print("Error creating inbody: \(error)")
            }
        }
    }
}
