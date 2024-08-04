//
//  EyeBodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

let eyeBodyDummy: [EyeBodyPhoto] = [EyeBodyPhoto(date: "2024년 7월 17일")]

struct EyeBodyMainView: View {
    @ObservedObject var viewModel: EyeBodyPhotoViewModel
    @State private var selectedDate: String?

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.photos, id: \.date) { photo in
                        VStack(alignment: .leading) {
                            Text(photo.date)
                                .font(.headline)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(0..<4, id: \.self) { index in
                                        if let image = photo.images[index] {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 200)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }

            CustomButtonView(title: "눈바디 추가하기") {
                // TODO:  - EyeBodyView로 이동 (isOnboarding: false로 설정)
            }
        }
        .onAppear {
            viewModel.fetchEyeBodyPhotos()
        }
    }
}

// #Preview {
//    EyeBodyMainView()
// }
