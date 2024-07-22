//
//  InputFeildView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct InputFieldView: View {
    @State private var newMessage = ""

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(width: .infinity, height: 100)
                .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)

            HStack(spacing: 8) {
                TextField("메시지를 입력하세요", text: $newMessage)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .leading)
                    .background(.gray10)
                    .cornerRadius(19)
                    .padding()

                Button {
                    // TODO: 메시지 보내기
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .padding(.trailing)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    InputFieldView()
}
