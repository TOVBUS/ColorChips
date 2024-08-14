//
//  InbodyAddView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyAddView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<OnboardingViewOptions>
    @EnvironmentObject var viewModel: AzureInbodyViewModel

    @State private var showOnboardingGaugeView = true
    @State private var showSkipButton = true
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var isImageSelected = false
    @State private var image: UIImage? = UIImage(named: "InbodyDefault")
    @State private var showCamera = false

    var body: some View {
        VStack {
            if showOnboardingGaugeView {
                OnboardingGaugeView(progress: 3)
            }

            VStack {
                Text("인바디 사진은 아래와 같이 등록해주세요!")
                    .font(.customFont(size: 20, weight: .bold))
                    .padding(.bottom, 36)

                ZStack {
                    Image(uiImage: image ?? UIImage(named: "InbodyDefault")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 400)
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    if !isImageSelected {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black.opacity(0.7))
                            .frame(width: 345, height: 434)

                        VStack {
                            Text("민감 정보는 서버에 저장되지 않아요!")
                                .foregroundStyle(Color(white: 1.0))
                                .font(.customFont(size: 18, weight: .bold))
                                .padding(.bottom, 26)

                            Text("건강 정보는 개인 기기에만 저장되며\n 그래프로 기록을 보여드리기 위함이니 안심하세요 😔")
                                .foregroundStyle(Color(white: 1.0))
                                .font(.customFont(size: 14, weight: .medium))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                Spacer()

                if !isImageSelected {
                    CustomButtonView(title: "등록하기") {
                        showActionSheet = true
                    }
                    .padding(.top, 40)

                    CustomButtonView(title: "건너뛰기") {
                        navigationPathFinder.addPath(option: .inbodyInputView)
                    }
                } else {
                    CustomButtonView(title: "다시찍기") {
                        showActionSheet = true
                    }
                    .padding(.top, 40)

                    CustomButtonView(title: "분석하기") {
                        viewModel.analyzeImage(image!)
                        if viewModel.isLoading && viewModel.error == nil {
                            navigationPathFinder.addPath(option: .onboardingLoadingView)
                        }
                    }
                }
            }
            .cameraActionSheet(isPresented: $showActionSheet) {
                DispatchQueue.main.async {
                    self.showCamera = true
                }
            } onGalleryTap: {
                DispatchQueue.main.async {
                    self.sourceType = .photoLibrary
                    self.showImagePicker = true
                }
            }
            .sheet(isPresented: $showImagePicker) {
                PhotoPicker(image: $image)
            }
            .fullScreenCover(isPresented: $showCamera) {
                CameraView(image: $image)
            }
            .onChange(of: image, { _, newImage in
                if newImage != nil {
                    isImageSelected = true
                }
            })
            .navigationBarBackButtonHidden()
        }

    }
}

#Preview {
    InbodyAddView()
}
