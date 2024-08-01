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

            CustomButtonView(title: "눈바디 추가하기") {
                // TODO: EyeBodyView로 이동
            }
        }
    }
}

#Preview {
    EyeBodyMainView()
}
