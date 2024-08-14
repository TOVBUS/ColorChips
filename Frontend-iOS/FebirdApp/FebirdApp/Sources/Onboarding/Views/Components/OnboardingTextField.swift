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
    let keyboardType: KeyboardType
    let autoFocus: Bool

    @Binding var text: String

    init(question: String, placeholder: String, unit: String, inputValue: String?, keyboardType: KeyboardType = .defaultType, autoFocus: Bool, text: Binding<String>) {
        self.question = question
        self.placeholder = placeholder
        self.unit = unit
        self.inputValue = inputValue
        self.keyboardType = keyboardType
        self.autoFocus = autoFocus
        self._text = text
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.customFont(size: 14, weight: .bold))
                .foregroundStyle(.gray100)
            HStack {
                CustomTextField(placeholder: placeholder, text: $text, keyboardType: keyboardType, autoFocus: autoFocus)
                    .font(.customFont(size: 18, weight: .medium))
                    .foregroundStyle(text == "" ? .gray30 : .gray100)
                Text(/*unit*/"durldurl")
                    .foregroundStyle(.gray100)
                    .font(.customFont(size: 18, weight: .medium))
            }.padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray10)
                )
        }
        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .leading)
        .onAppear(perform: {
            if text.isEmpty, let inputValue = inputValue {
                text = inputValue
            }
        })
    }
}

 #Preview {
    OnboardingTextField(question: "체중", placeholder: "46.3", unit: "kg", inputValue: "46.3", autoFocus: true, text: .constant(""))
 }
