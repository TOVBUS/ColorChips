//
//  ChatTextFieldView.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import SwiftUI

struct ChatTextFieldView: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    @FocusState private var isTextFieldFocused: Bool
    @ObservedObject var viewModel: ChatViewModel

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)

            HStack(spacing: 8) {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .focused($isTextFieldFocused)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(height: 56, alignment: .leading)
                    .foregroundStyle(.gray100)
                    .background(.gray10)
                    .cornerRadius(19)
                    .padding()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isTextFieldFocused = true
                        }
                    }

                Button {
                    Task {
                        await viewModel.sendMessage(content: text)
                        text = ""
                    }
                    hideKeyboard()
                } label: {
                    Image("sendIcon")
                }
                .padding(.trailing)
                //                .onTapGesture {
                //                    hideKeyboard()
                //                }
            }
            .padding(.bottom, 10)
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct OnboardingTextFieldView: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    hideKeyboard()
                }

            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1.0)
                )
                .padding(.horizontal, 30)
                .focused($isTextFieldFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isTextFieldFocused = true
                    }
                }
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: - merge 후 삭제 필요
enum KeyboardType {
    case defaultType
    case numberPad
}

struct CustomTextField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    var keyboardType: KeyboardType

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

        DispatchQueue.main.async {
            textField.becomeFirstResponder()
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
