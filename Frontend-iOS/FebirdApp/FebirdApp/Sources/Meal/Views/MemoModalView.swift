//
//  MemoModalView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.gray20
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center) {
                        Text("식단을 기록하세요")
                            .font(.customFont(size: 20, weight: .bold))
                        Spacer()
                        Button {
                            //뷰 계층 구조에서 정의된 환경 변수에 접근하기 .dissmiss() 호출
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack(alignment: .center, spacing: 16) {
                                Text("추가하기")
                                    .font(.customFont(size: 14, weight: .bold))
                                    .foregroundStyle(Color.white)
                            }
                            .frame(width: 77, height: 32, alignment: .center)
                            .background(Color.orange50)
                            .cornerRadius(12)
                        }
                    }
                    .padding(0)
                    .frame(width: 343, alignment: .center)
                    VStack(alignment: .center, spacing: 16) {
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
                    // 텍스트 필드
                    VStack(alignment: .leading, spacing: 10) {
                        TextEditor(text: $text)
                        Spacer()
                        HStack {
                            Spacer()
                            Image("fileIcon")
                            Text("11/200")
                                .font(.customFont(size: 16, weight: .bold))
                                .foregroundStyle(Color.gray40)
                        }
                        .padding()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 0)
                    .frame(width: 343, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(24)
                    Spacer()
                }
                .padding(30)
            }
        }
    }
}

#Preview {
    MemoModalView()
}
