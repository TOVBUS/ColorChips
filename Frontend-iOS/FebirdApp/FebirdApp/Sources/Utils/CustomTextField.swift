//
//  CustomTextField.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import Foundation
import SwiftUI

enum KeyboardType {
    case defaultType
    case numberPad
}

struct CustomTextField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    var keyboardType: KeyboardType
    var autoFocus: Bool

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.delegate = context.coordinator

        switch keyboardType {
        case .defaultType:
            textField.keyboardType = .default
        case .numberPad:
            textField.keyboardType = .numberPad
        }

        if autoFocus {
            DispatchQueue.main.async {
                textField.becomeFirstResponder()
            }
        }

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
