//
//  InbodyAddView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyAddView: View {
    @State private var showOnboardingGaugeView = true
    @State private var showSkipButton = true

    var body: some View {
        VStack {
            if showOnboardingGaugeView {
                OnboardingGaugeView(progress: 4)
                    .padding(.top, 26)
                    .padding(.bottom, 56)
            }
            Text("인바디 사진은 아래와 같이 등록해주세요!")
                .font(.customFont(language: .korean, size: 20, weight: .bold))
                .padding(.bottom, 36)
            ZStack {
                Image("InbodyDefault")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.7))
                    .frame(width: 345, height: 434)

                VStack {
                    Text("민감 정보는 서버에 저장되지 않아요!")
                        .foregroundStyle(Color(white: 1.0))
                        .font(.customFont(language: .korean, size: 18, weight: .bold))
                        .padding(.bottom, 26)
                    Text("건강 정보는 개인 기기에만 저장되며\n 그래프로 기록을 보여드리기 위함이니 안심하세요 😔")
                        .foregroundStyle(Color(white: 1.0))
                        .font(.customFont(language: .korean, size: 14, weight: .medium))
                        .multilineTextAlignment(.center)
                }
            }

            Spacer()
            Button("등록하기") {

            }
            .frame(maxWidth: .infinity, maxHeight: 56)
            .foregroundStyle(Color(.white))
            .font(.customFont(language: .korean, size: 16, weight: .semibold))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
            )
            if showSkipButton {
                Button("건너뛰기") {

                }
                .frame(maxWidth: .infinity, maxHeight: 56)
                .foregroundStyle(Color(.white))
                .font(.customFont(language: .korean, size: 16, weight: .semibold))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                )
            }
        }.padding(.horizontal, 24)
    }
}

#Preview {
    InbodyAddView()
}
