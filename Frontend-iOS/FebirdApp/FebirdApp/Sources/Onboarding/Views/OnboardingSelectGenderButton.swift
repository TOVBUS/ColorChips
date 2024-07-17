//
//  OnboardingSelectGenderButton.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

enum Gender {
    case male, female
}

struct OnboardingSelectGenderButton: View {
    @State var selectedGender: Gender = .female

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.2))

            HStack(spacing: 0, content: {
                GenderButton(title: "남", gender: .male, selectedGender: $selectedGender)
                GenderButton(title: "여", gender: .female, selectedGender: $selectedGender)
            })
        }
        .frame(height: 50)
    }
}

struct GenderButton: View {
    let title: String
    let gender: Gender
    @Binding var selectedGender: Gender

    var body: some View {
        Button(action: {
            selectedGender = gender
        }, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selectedGender == gender ? Color.black : Color.clear)
                )
                .foregroundStyle(selectedGender == gender ? .white : .black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedGender == gender ? Color.red : Color.clear, lineWidth: 2)
                )
        })
    }
}

#Preview {
    OnboardingSelectGenderButton()
}
