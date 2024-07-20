//
//  OnboardingTextField.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingTextField: View {
    let question: String
    let placeholder: String
    let unit: String
    let inputValue: String?
    @Binding var text: String

    init(question: String, placeholder: String, unit: String, inputValue: String?, text: Binding<String>) {
        self.question = question
        self.placeholder = placeholder
        self.unit = unit
        self.inputValue = inputValue
        self._text = text
    }

    var body: some View {
        VStack(alignment: .leading, content: {
            Text(question)
                .font(.customFont(size: 14, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
            HStack {
                TextField(placeholder, text: $text)
                    .font(.customFont(size: 18, weight: .medium))
                    .foregroundStyle(Color(red: 0.61, green: 0.64, blue: 0.69))
                Text(unit)
                    .foregroundStyle(Color(red: 31/255, green: 41/255, blue: 55/255))
            }.padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                )
        })
        .onAppear(perform: {
            if text.isEmpty, let inputValue = inputValue {
                text = inputValue
            }
        })
    }
}

#Preview {
    OnboardingTextField(question: "체중", placeholder: "46.3", unit: "kg", inputValue: "46.3", text: .constant(""))
}
