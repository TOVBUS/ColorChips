//
//  MemoRow.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoRow: View {
    @State var showSheet: Bool = false
    var mealTime: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 8) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80)
                    .background(
                        Image("BigfaceFeo") // 이미지 변경
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
                    .background(Color(red: 0.84, green: 0.85, blue: 0.85))
                    .cornerRadius(8)
                    .font(.customFont(size: 14, weight: .bold))
                    Text("연어샐러드") // 처음엔 비어있어야함
                        .font(.customFont(size: 14, weight: .medium))
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Image("elseIcon")
                        .foregroundStyle(Color.black)
                })
                .frame(width: 24, height: 24)
                .sheet(isPresented: $showSheet, content: {
                    MemoModalView()
                })
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(width: 343, alignment: .topLeading)
        .background(Color(red: 0.95, green: 0.95, blue: 0.96))
        .cornerRadius(32)
    }
}

#Preview {
    MemoRow(mealTime: "점심")
}
