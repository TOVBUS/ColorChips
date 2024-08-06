//
//  MemoModalView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var showCamera = false
    @Binding var image: UIImage?
    @Binding var contentText: String
    @Binding var titleText: String
    @State private var temporaryTitleText: String
    @State private var temporaryContentText: String

    init(image: Binding<UIImage?>, contentText: Binding<String>, titleText: Binding<String>) {
        self._image = image
        self._contentText = contentText
        self._titleText = titleText
        self._temporaryTitleText = State(initialValue: titleText.wrappedValue)
        self._temporaryContentText = State(initialValue: contentText.wrappedValue)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerView
                imageUploadView
                textInputView
            }
            .padding(25)
        }
        .background(Color.gray10.ignoresSafeArea())
        .cameraActionSheet(isPresented: $showActionSheet,
                           onCameraTap: { showCamera = true },
                           onGalleryTap: { showImagePicker = true })
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(image: $image)
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraView(image: $image)
        }
    }
    // MARK: - 식단 기록
    private var headerView: some View {
        HStack {
            Text("식단을 기록하세요")
                .font(.customFont(size: 20, weight: .bold))
            Spacer()
            Button("추가하기") {
                titleText = temporaryTitleText
                contentText = temporaryContentText
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(.orange50)
            .foregroundColor(.white)
            .cornerRadius(12)
            .font(.customFont(size: 14, weight: .bold))
        }
    }
    // MARK: - 이미지 업로드
    private var imageUploadView: some View {
        Button(action: {
            showActionSheet = true
        }) {
            VStack {
                Image(uiImage: image ?? UIImage(named: "uploadIcon")!)
                    .resizable()
                    .scaledToFit()
                    .frame(height: image == nil || image == UIImage(named: "uploadIcon") ? 70 : 200)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.gray100, lineWidth: 1)
                .fill(Color.white)
        )
    }
    // MARK: - 텍스트 입력
    private var textInputView: some View {
        VStack {
            TextField("제목을 입력하세요", text: $temporaryTitleText)
                .padding(15)
                .frame(height: 70)
                .background(.white)
                .cornerRadius(20, corners: .allCorners)

            VStack {
                TextEditor(text: $temporaryContentText)
                    .padding(15)
                    .frame(height: 200)
                    .background(.white)

                HStack {
                    Spacer()
                    Image("fileIcon")
                    Text("\(temporaryContentText.count) / 200")
                        .font(.customFont(size: 16, weight: .medium))
                        .foregroundStyle(.gray40)
                }
                .padding(10)
            }
            .background(.white)
            .cornerRadius(24)
            .onChange(of: temporaryContentText) { _, newValue in
                if newValue.count > 200 {
                    temporaryContentText = String(newValue.prefix(200))
                }
            }
        }
    }
}

#Preview {
    MemoModalView(image: .constant(UIImage(contentsOfFile: "feoFace")), contentText: .constant("content"), titleText: .constant("title"))
}
