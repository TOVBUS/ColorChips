//
//  MemoModalView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.scenePhase) private var scenePhase
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
                    .frame(width: 77, height: 32)
                    .background(.orange50)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.customFont(size: 14, weight: .bold))
                }

                // MARK: - 이미지 업로드
                VStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        // TODO: 카메라 & 앨범 알럿
                    }, label: {
                        Image("uploadIcon")
                    })

                    Text("사진 등록하기")
                        .font(.customFont(size: 16, weight: .medium))
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .inset(by: 1)
                        .stroke(.gray100)
                )

                // MARK: - 텍스트 입력창
                VStack {
                    TextEditor(text: $temporaryText)
                        .scrollContentBackground(.hidden)

                    HStack {
                        Spacer()

                        Image("fileIcon")

                        Text("\(temporaryText.count) / 200")
                            .font(.customFont(size: 16, weight: .medium))
                            .foregroundColor(.gray40)
                            .onChange(of: temporaryText) { _, newValue in
                                if newValue.count > 200 {
                                    temporaryText = String(newValue.prefix(200))
                                }
                            }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .background(.white)
                .cornerRadius(24)
            }
            .padding(25)
        }

    }
}

#Preview {
    MemoModalView(text: .constant("dd"))
}
