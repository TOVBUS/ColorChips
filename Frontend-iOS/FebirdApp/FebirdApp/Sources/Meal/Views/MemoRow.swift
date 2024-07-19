//
//  MemoRow.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoRow: View {
    @State var showSheet: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 8) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80)
                    .background(
                        Image("BigfaceFeo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    )
                VStack(alignment: .leading, spacing: 8) {
                    Text("아침") // 아침, 점심, 저녁
                    Text("연어샐러드") // 처음엔 비어있어야함
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Image(systemName: "pencil")
                        .foregroundStyle(Color.black)
                })
                .frame(width: 24, height: 24)
                .sheet(isPresented: $showSheet, content: {
//                    MemoView()
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
    MemoRow()
}
