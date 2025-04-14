//
//  InbodyFixView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyFixView: View {
    @EnvironmentObject var onboardingNavigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @EnvironmentObject var viewModel: AzureInbodyViewModel
    @EnvironmentObject var inbodyViewModel: InbodyViewModel
    @EnvironmentObject var tabViewModel: TabViewModel
    
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: String = ""
    @State private var bodyfat: String = ""
    @State private var bmr: String = ""
    @State private var showActionSheet = false
    
    var body: some View {
        ScrollView {
<<<<<<< HEAD
            if onboardingNavigationPathFinder.isFirstEnteredApp {
                OnboardingGaugeView(progress: 4)
            }
            else {
                HStack {
                    Button {
                        profileNavigationPathFinder.popPath()
                    } label: {
                        Image("Chevron-left")
                    }
                    
                    Spacer()
                    
                    Text("인바디 수정")
                        .font(.customFont(size: 22, weight: .bold))
                        .foregroundStyle(.gray100)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
=======
            if !navigationPathFinder.isFirstEnteredApp {
                OnboardingGaugeView(progress: 4)
            }

>>>>>>> 6d4c919 (🐛 :: 뭔가 고친 것 같은데 기억 나지 않음 ...)
            Text("정보가 다르게 인식됐나요? \n여기에서 수정할 수 있어요 😉")
                .font(.customFont(size: 20, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                .padding(.bottom, 46)
            
            VStack(spacing: 20) {
                OnboardingTextField(question: "체중 *", placeholder: viewModel.weight?.content.extractNumbers() ?? "45.3", unit: "kg", inputValue: weight, keyboardType: .numberPad, autoFocus: false, text: $weight)
                OnboardingTextField(question: "키 *", placeholder: "160", unit: "cm", inputValue: height, keyboardType: .numberPad, autoFocus: false, text: $height)
                OnboardingTextField(question: "BMI", placeholder: viewModel.bmi?.content.extractNumbers() ?? "17.6", unit: "%", inputValue: bmi, keyboardType: .numberPad, autoFocus: false, text: $bmi)
                OnboardingTextField(question: "체지방량", placeholder: viewModel.bodyFat?.content.extractNumbers() ?? "9.6", unit: "%", inputValue: bodyfat, keyboardType: .numberPad, autoFocus: false, text: $bodyfat)
                OnboardingTextField(question: "기초대사량", placeholder: viewModel.bmr?.content.extractNumbers() ?? "kcal", unit: "kg", inputValue: bmr, keyboardType: .numberPad, autoFocus: false, text: $bmr)
            }
            .padding(.horizontal, 20)
            .foregroundStyle(.gray100)
            
            CustomButtonView(title: "다시찍기") {
                showActionSheet = true
            }
            .padding(.top, 40)
            
            CustomButtonView(title: "저장하기") {
                saveInbodyData()
                if onboardingNavigationPathFinder.isFirstEnteredApp {
                    onboardingNavigationPathFinder.addPath(option: .eyeBodyView)
                }
                else {
                    profileNavigationPathFinder.popToRoot()
                    tabViewModel.isHidden = false
                }
            }
        }
        .background(Color.gray10.ignoresSafeArea())
        .navigationBarBackButtonHidden()
<<<<<<< HEAD
        .preferredColorScheme(.light)
=======
        .padding(.vertical, 60)
>>>>>>> 6d4c919 (🐛 :: 뭔가 고친 것 같은데 기억 나지 않음 ...)
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
                // TODO: isFirstEnteredApp가 false일 때 수정값 백엔드 연결 추가
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
// MARK: 문자열 숫자 추출
extension String {
    func extractNumbers() -> String {
        let numberSet = CharacterSet.decimalDigits
        return self.unicodeScalars.filter { numberSet.contains($0) }.map { String($0) }.joined()
    }
}
