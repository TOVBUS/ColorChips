//
//  EyeBodyView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct EyeBodyView: View {
    @Binding var isOnboarding : Bool
    @State private var selectedImages: [UIImage?] = [nil, nil, nil, nil]
    @State private var showImagePicker = false
    @State private var currentImageIndex = 0

    var body: some View {
        VStack {
            if isOnboarding {
                OnboardingGaugeView(progress: 9)
            }
            Text("눈바디를 기록해볼까요?")
                .font(.customFont(size: 20, weight: .bold))
                .padding(.bottom, 44)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15, content: {
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                        .frame(height: 210)
                }
            }).padding(.horizontal, 20)
                .padding(.bottom, 44)
            // 온보딩로직일땐 건너뛰기 버튼 추가
            if isOnboarding {
                Button(action: {
                    // 다음뷰로 이동 로직
                }, label: {
                    Text("건너뛰기")
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .foregroundStyle(Color(.white))
                        .font(.customFont(size: 16, weight: .semibold))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                        )
                })
            }

            Button(action: {
                // 저장 로직
            }, label: {
                Text("저장하기")
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    EyeBodyView(isOnboarding: .constant(true))
}
