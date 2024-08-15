//
//  InbodyInputView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct InbodyInputView: View {
    @EnvironmentObject var onboardingNavigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @EnvironmentObject var inbodyViewModel: InbodyViewModel
    @EnvironmentObject var tabViewModel: TabViewModel
    
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: String = ""
    @State private var bodyfat: String = ""
    @State private var bmr: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            if !profileNavigationPathFinder.isFirstEnteredApp {
                OnboardingGaugeView(progress: 5)
            }
            else {
                HStack {
                    Button {
                        profileNavigationPathFinder.popToRoot()
                        tabViewModel.isHidden = false
                    } label: {
                        Image("Chevron-left")
                    }

                    Spacer()

                    Text("인바디 추가")
                        .font(.customFont(size: 22, weight: .bold))
                        .foregroundStyle(.gray100)

                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            VStack {
                ScrollView {
                    Text("체중과 키를 기록하면 변화를 그래프로 보여드릴게요 😉")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
                        .padding(.bottom, 46)
                        .padding(.horizontal, 20)
                    
                    VStack(spacing: 20) {
                        OnboardingTextField(question: "체중 *", placeholder: "70", unit: "kg", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $weight)
                        OnboardingTextField(question: "키 *", placeholder: "170", unit: "cm", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $height)
                        OnboardingTextField(question: "BMI", placeholder: "17.6", unit: "%", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bmi)
                        OnboardingTextField(question: "체지방량", placeholder: "9.6", unit: "%", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bodyfat)
                        OnboardingTextField(question: "기초대사량", placeholder: "1500", unit: "kcal", inputValue: nil, keyboardType: .numberPad, autoFocus: false, text: $bmr)
                    }
                    .padding(.horizontal, 30)
                }
                
                CustomButtonView(title: "저장하기") {
                    saveInbodyData()
                    if !profileNavigationPathFinder.isFirstEnteredApp {
                        onboardingNavigationPathFinder.addPath(option: .onboardingEndView)
                    } else {
                        profileNavigationPathFinder.popToRoot()
                        tabViewModel.isHidden = false
                    }
                }
                if !profileNavigationPathFinder.isFirstEnteredApp {
                    CustomButtonView(title: "건너뛰기") {
                        onboardingNavigationPathFinder.addPath(option: .onboardingEndView)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
        .onAppear {
            tabViewModel.isHidden = true
        }
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
