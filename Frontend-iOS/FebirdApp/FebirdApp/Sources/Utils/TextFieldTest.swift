//
//  TextFieldTest.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import SwiftUI
import Combine

struct TextFieldTest: View {
    var placeholder: String
    @Binding var text: String
    @FocusState private var isTextFieldFocused: Bool
    @ObservedObject var viewModel: ChatViewModel
    @StateObject private var keyboardHandler = KeyboardHandler()

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)

            HStack(spacing: 8) {
                TextField(placeholder, text: $text)
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
                } label: {
                    Image("sendIcon")
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(height: 100)
        .background(Color.clear)
    }
}

final class KeyboardHandler: ObservableObject {
    @Published private(set) var keyboardHeight: CGFloat = 0

    private var cancellable: AnyCancellable?

    private let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap { notification -> CGFloat? in
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return nil
            }
            return keyboardFrame.height
        }

    private let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }

    init() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] height in
                self?.keyboardHeight = min(height, UIScreen.main.bounds.height / 2)
            }
    }
}
