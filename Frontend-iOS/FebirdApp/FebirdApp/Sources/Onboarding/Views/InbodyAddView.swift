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
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var isImageSelected = false
    @State private var image: UIImage? = UIImage(named: "InbodyDefault")
    @State private var showCamera = false

    var body: some View {
        VStack {
            if showOnboardingGaugeView {
                OnboardingGaugeView(progress: 4)
                    .padding(.top, 26)
                    .padding(.bottom, 56)
            }
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
                        .fill(Color.black.opacity(0.7))
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
                Button(action: {
                    showActionSheet = true
                }, label: {
                    Text("등록하기")
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .foregroundStyle(Color(.white))
                        .font(.customFont(size: 16, weight: .semibold))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                        )
                })

                if showSkipButton {
                    Button(action: {
                        // 건너뛰기 동작 구현
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
            } else {
                Button(action: {
                    showActionSheet = true
                }, label: {
                    Text("다시찍기")
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .foregroundStyle(Color(.white))
                        .font(.customFont(size: 16, weight: .semibold))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.07, green: 0.07, blue: 0.08))
                        )
                })

                Button(action: {
                    // 분석하기 동작 구현
                }, label: {
                    Text("분석하기")
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
        .padding(.horizontal, 24)
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
    }
}

#Preview {
    InbodyAddView()
}
