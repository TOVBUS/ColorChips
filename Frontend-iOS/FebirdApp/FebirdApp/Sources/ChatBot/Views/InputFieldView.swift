//
//  InputFeildView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var text: String
    @ObservedObject var viewModel: ChatViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)

            HStack(spacing: 8) {
                TextField("메시지를 입력하세요", text: $text)
                    .focused($isFocused)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(height: 56, alignment: .leading)
                    .foregroundStyle(.gray100)
                    .background(.gray10)
                    .cornerRadius(19)
                    .padding()

                Button {
                    Task {
                        await viewModel.sendMessage(content: text)
                        text = ""
                    }
                    isFocused = false
                } label: {
                    Image("sendIcon")
                }
                .padding(.trailing)
            }
            .padding(.bottom, 10)
        }
    }
}
//
// #Preview {
//    @State var previewText = "안녕하세요"
//
//    return InputFieldView(text: $previewText, viewModel: ChatViewModel())
// }
