//
//  ProfileSettingHeaderView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

class ProfileSettingHeaderViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showActionSheet = false
    @Published var showImagePicker = false
    @Published var showCamera = false
    @Published var isImageSelected = false

    init() {
        loadUserImage()
    }

    func loadUserImage() {
        // TODO: 실제 사용자 이미지 로드 로직 구현
        image = UIImage(named: "profile01")
    }

    func updateImage(_ newImage: UIImage?) {
        image = newImage
        isImageSelected = newImage != nil
        // TODO: 새 이미지 저장 로직 구현
    }
}

struct ProfileSettingHeaderView: View {

    @EnvironmentObject private var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @StateObject private var viewModel = ProfileSettingHeaderViewModel()

    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var isImageSelected = false
    @State private var image: UIImage? = UIImage(named: "profile01")
    @State private var showCamera = false

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 180)
                .foregroundStyle(.gray100)
                .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()

            HStack(alignment: .center) {
                Button {
                    profileNavigationPathFinder.popPath()
                } label: {
                    Image("backButton")
                }

                HStack {
                    Spacer()

                    Text("프로필 설정")
                        .foregroundStyle(.white)
                        .font(.customFont(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .top)

                    Spacer()
                }
                .padding(.trailing, 48)
            }
            .padding(.horizontal, 20)

            Button {
                showActionSheet = true
            } label: {
                ZStack {
                    Image(uiImage: viewModel.image ?? UIImage(named: "profile01")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.top, 140)

                    Image("cameraButton")
                        .offset(x: 40, y: 110)
                }
                .offset(y: 20)
            }
            .cameraActionSheet(isPresented: $viewModel.showActionSheet) {
                viewModel.showCamera = true
            } onGalleryTap: {
                viewModel.showImagePicker = true
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                PhotoPicker(image: Binding(
                    get: { viewModel.image },
                    set: { viewModel.updateImage($0) }
                ))
            }
            .fullScreenCover(isPresented: $viewModel.showCamera) {
                CameraView(image: Binding(
                    get: { viewModel.image },
                    set: { viewModel.updateImage($0) }
                ))
            }
        }
        .frame(height: 180)
    }
}
#Preview {
    ProfileSettingHeaderView()
        .environmentObject(NavigationPathFinder<ProfileViewOptions>())
}
