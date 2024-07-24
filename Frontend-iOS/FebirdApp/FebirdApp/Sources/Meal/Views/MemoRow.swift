//
//  MemoRow.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoRow: View {
    @State private var inputText = ""
    @State private var showModal = false
    @State private var showFullText = false
    var mealTime: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 8) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80)
                    .background(
                        Image("feoFace") // 이미지 변경
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    )
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .center, spacing: 16) {
                        Text(mealTime) // 아침, 점심, 저녁
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .frame(height: 24, alignment: .center)
                    .background(Color.gray20)
                    .cornerRadius(8)
                    .font(.customFont(size: 14, weight: .bold))
                    if !inputText.isEmpty {
                        Text(showFullText ? inputText : inputText.prefix(30) + (inputText.count > 30 ? "..." : ""))
                            .font(.customFont(size: 14, weight: .medium))
                            .lineLimit(showFullText ? nil : 1)
                            .onTapGesture {
                                withAnimation {
                                    showFullText.toggle()
                                }
                            }
                    }
                }
                Spacer()
                Button(action: {
                    showModal.toggle()
                }, label: {
                    Image("vertialIcon")
                })
                .frame(width: 24, height: 24)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray10)
            .cornerRadius(32)
            .sheet(isPresented: $showModal) {
                MemoModalView(text: $inputText)
            }
        }
        .padding(12)
        .frame(width: 343, alignment: .topLeading)
        .background(Color.gray10)
        .cornerRadius(32)
    }
}

#Preview {
    MemoRow(mealTime: "점심")
}
