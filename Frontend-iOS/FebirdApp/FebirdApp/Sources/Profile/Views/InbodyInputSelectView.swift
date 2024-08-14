//
//  InbodyInputSelectView.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/12/24.
//

import SwiftUI

struct InbodyInputSelectView: View {
    @Binding var isPresented: Bool

    var body: some View {

        VStack {
            HStack {
                Spacer()
                Text("인바디를 등록하세요")
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundStyle(.gray100)
                Spacer()
            }
            .padding(.top, 32)
            .padding(.bottom, 56)

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 300, height: 354)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: -2, y: -2)

                Image("peoLogo")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipped()
            }

            Spacer()

            CustomButtonView(title: "사진찍기") {

            }.padding(.bottom, 10)

            CustomButtonView(title: "수기입력") {

            }
        }
        .background(.white)
    }
}

#Preview {
    InbodyInputSelectView(isPresented: .constant(true))
}
