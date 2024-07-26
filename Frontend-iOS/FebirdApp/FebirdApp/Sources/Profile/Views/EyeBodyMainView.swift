//
//  EyeBodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct EyeBodyPhoto {
    let date: String
    let images: [UIImage?] = [nil, nil, nil, nil]
}

let eyeBodyDummy: [EyeBodyPhoto] = [EyeBodyPhoto(date: "2024년 7월 17일")]

struct EyeBodyMainView: View {
    var body: some View {
        VStack {
            ScrollView {
                ScrollView(.horizontal) {
                    // TODO: - 일별 눈바디 사진 UI 구현
                }
            }
            Button(action: {
                // TODO: EyeBodyView로 이동
            }, label: {
                Text("눈바디 추가하기")
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .foregroundStyle(Color(.white))
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                    )
            })
        }
    }
}

#Preview {
    EyeBodyMainView()
}
