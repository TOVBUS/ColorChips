//
//  ChatingInput.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct ChatingInput: View {
    @State private var text = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(width: .infinity, height: 100)
            .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)
            HStack {
                TextField("텍스트를 입력하세요", text: $text)
                    .font(.customFont(size: 18, weight: .medium))
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.gray100)
                    .padding(20)
                Button(action: {
                    // TODO: 채팅입력
                }, label: {
                    // TODO: 보내기 버튼
                    Image(systemName: "arrow.forward")
                        .background(.gray20)
                        .padding(30)
                })
            }
        }
    }
}

#Preview {
    ChatingInput()
}
