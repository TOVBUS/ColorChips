//
//  MemoModalView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var text: String
    @State private var temporaryText = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.gray20
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .center) {
                    Text("식단을 기록하세요")
                        .font(.customFont(size: 20, weight: .bold))
                    Spacer()
                    Button("추가하기") {
                        text = temporaryText
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 77, height: 32, alignment: .center)
                    .background(Color.orange50)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.customFont(size: 14, weight: .bold))
                }
                VStack(alignment: .center, spacing: 20) {
                    // 이미지 업로드
                    Button(action: {
                        // 카메라 & 앨범 선택창
                    }, label: {
                        Image("uploadIcon")
                    })
                    Text("사진 등록하기")
                        .font(.customFont(size: 16, weight: .medium))
                }
                .padding(24)
                .frame(width: 343, alignment: .top)
                .background(.white)
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .inset(by: 1)
                        .stroke(Color.gray100)
                )
                // 텍스트 입력창
                VStack(alignment: .leading, spacing: 10) {
                    TextEditor(text: $temporaryText)
                        .scrollContentBackground(.hidden)
                    
                    HStack {
                        Spacer()
                        Image("fileIcon")
                        Text("\(temporaryText.count) / 200")
                            .font(.customFont(size: 16, weight: .medium))
                            .foregroundColor(Color.gray40)
                            .onChange(of: temporaryText) { newValue in
                                if newValue.count > 200 {
                                    temporaryText = String(newValue.prefix(200))
                                }
                            }
                    }
                    .padding()
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .frame(width: 343, height: 300, alignment: .topLeading)
                .background(.white)
                .cornerRadius(24)
                Spacer()
            }
            .padding(30)
        }
        
    }
}

#Preview {
    MemoModalView(text: .constant("dd"))
}
