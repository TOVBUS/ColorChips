//
//  InbodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct InbodyMainView: View {
    var body: some View {

        VStack {
            ProfileTopView()
            ScrollView {
                InbodyGraphView(title: "체중")
                InbodyGraphView(title: "기초대사량")
                InbodyGraphView(title: "체지방량")
            }.padding(.horizontal, 20)
            Button(action: {
            }, label: {
                Text("인바디 추가하기")
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.light)

    }
}

#Preview {
    InbodyMainView()
}