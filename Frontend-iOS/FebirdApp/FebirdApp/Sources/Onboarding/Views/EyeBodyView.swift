//
//  EyeBodyView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/19/24.
//

import SwiftUI

struct EyeBodyView: View {
    @EnvironmentObject var onboardingNavigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @StateObject private var viewModel = EyeBodyPhotoViewModel()
    @Environment(\.modelContext) private var modelContext

    var isOnboarding: Bool = true
    @State private var selectedImages: [UIImage?] = [nil, nil, nil, nil]
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var showCamera = false
    @State private var currentImageIndex = 0

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
                .ignoresSafeArea()
            VStack {
                if isOnboarding {
                    OnboardingGaugeView(progress: 7)
                }
                VStack {
                    Text("눈바디를 기록해볼까요?")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.black)
                        .padding(.bottom, 36)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15, content: {
                        ForEach(0..<4) { index in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                                .frame(height: 210)
                                .overlay {
                                    Group {
                                        if let image = selectedImages[index] {
                                            Image(uiImage: image)
                                                .resizable()
                                                .frame(width: 140, height: 210)
                                                .aspectRatio(contentMode: .fill)
                                        } else {
                                            Text(getPlaceholder(for: index))
                                                .font(.customFont(size: 18, weight: .medium))
                                                .foregroundStyle(.black)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    currentImageIndex = index
                                    showActionSheet = true
                                }
                        }
                    }).padding(.horizontal, 20)
                        .padding(.bottom, 44)

                    CustomButtonView(title: "저장하기") {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
                        let currentDate = dateFormatter.string(from: Date())

                        if selectedImages.contains(where: { $0 != nil }) {
                            Task {
                                await viewModel.saveOrUpdateEyeBodyPhoto(date: currentDate, images: selectedImages, context: modelContext)
                            }
                        }

                        if isOnboarding {
                            onboardingNavigationPathFinder.addPath(option: .onboardingEndView)
                        } else {
                            profileNavigationPathFinder.popPath()
                        }
                    }

                    if isOnboarding {
                        CustomButtonView(title: "건너뛰기") {
                            onboardingNavigationPathFinder.addPath(option: .onboardingEndView)
                        }
                    }
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("사진 선택"), buttons: [
                        .default(Text("사진 찍기")) {
                            self.showCamera = true
                        },
                        .default(Text("앨범에서 선택")) {
                            self.showImagePicker = true
                        },
                        .cancel()
                    ])
                }
                .sheet(isPresented: $showImagePicker) {
                    PhotoPicker(image: $selectedImages[currentImageIndex])
                }
                .fullScreenCover(isPresented: $showCamera) {
                    CameraView(image: $selectedImages[currentImageIndex])
                }
            }
            .padding(.top, 30)
        }
        .navigationBarBackButtonHidden()
    }

    func getPlaceholder(for index: Int) -> String {
        switch index {
        case 0: return "정면 사진\n추가하기"
        case 1: return "후면 사진\n추가하기"
        case 2: return "좌측면 사진\n추가하기"
        case 3: return "우측면 사진\n추가하기"
        default: return "사진\n추가하기"
        }
    }
}

#Preview {
    EyeBodyView(isOnboarding: true)
}
