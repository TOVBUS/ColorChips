//
//  ChatTextFieldView.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import SwiftUI
import Combine

struct ChatTextFieldView: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    @FocusState private var isTextFieldFocused: Bool
    @ObservedObject var viewModel: ChatViewModel
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        GeometryReader { _ in
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
                        .cornerRadius(18)

                    Button {
                        Task {
                            await viewModel.sendMessage(content: text)
                            text = ""
                        }
                        hideKeyboard()
                    } label: {
                        Image("sendIcon")
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)

            }
            .offset(y: -keyboardHeight)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isTextFieldFocused = true
            }
        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// 키보드 높이를 실시간으로 감지하는 Publisher
extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification -> CGFloat in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
            }

        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
