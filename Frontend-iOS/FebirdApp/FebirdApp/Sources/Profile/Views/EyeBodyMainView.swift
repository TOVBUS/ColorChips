//
//  EyeBodyMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

let eyeBodyDummy: [EyeBodyPhoto] = [EyeBodyPhoto(date: "2024년 7월 17일")]

struct EyeBodyMainView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = EyeBodyPhotoViewModel()
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ProfileViewOptions>

    @State private var selectedDate: String?

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.photos, id: \.date) { photo in
                        VStack(alignment: .leading) {
                            Text(photo.date)
                                .font(.customFont(size: 20, weight: .bold))
                                .foregroundStyle(.gray100)
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
                navigationPathFinder.addPath(option: .eyeBodyView(isOnboarding: false))
            }
        }
        .onAppear {
            viewModel.fetchEyeBodyPhotos(context: modelContext)
        }
    }
}

 #Preview {
    EyeBodyMainView()
 }
