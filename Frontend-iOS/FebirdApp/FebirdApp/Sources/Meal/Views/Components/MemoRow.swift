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
        HStack(spacing: 8) {
            Image("feoFace")

            VStack(alignment: .leading, spacing: 8) {
                Text(mealTime) // 아침, 점심, 저녁
                    .font(.customFont(size: 14, weight: .bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(.orange30)
                    .cornerRadius(8)

                // MARK: - 글자수 제한
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
                Image(systemName: "plus")
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.gray60)
                    .padding(8)
                    .background(
                        Rectangle()
                            .foregroundStyle(.gray20)
                            .cornerRadius(4, corners: .allCorners)
                    )
            })
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.gray10)
        .cornerRadius(32)
        .sheet(isPresented: $showModal) {
            MemoModalView(text: $inputText)
        }
    }
}

#Preview {
    MemoRow(mealTime: "점심")
}
