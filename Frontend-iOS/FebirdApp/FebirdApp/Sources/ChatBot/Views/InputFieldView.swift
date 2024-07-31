//
//  InputFeildView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var text: String
    
    var onSend: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("메시지를 입력하세요", text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 56, alignment: .leading)
                .background(.gray10)
                .cornerRadius(20)
                
            Button {
                // TODO: 메시지 보내기
                onSend()
            } label: {
                Image("sendIcon")
            }
        }
        .padding(.bottom, 24)
        .padding(.horizontal)
        .frame(height: 120)
        .background(
            Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(maxWidth: .infinity)
                .shadow(color: .gray20, radius: 5, x: 0, y: 2)
        )
    }
}
