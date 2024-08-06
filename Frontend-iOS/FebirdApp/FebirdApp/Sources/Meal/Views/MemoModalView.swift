//
//  MemoModalView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI
import SwiftData

struct MemoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MemoViewModel
    let date: Date
    let mealType: MealType
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var showCamera = false
    @State private var image: UIImage?
    @State private var temporaryTitleText: String = ""
    @State private var temporaryContentText: String = ""

    init(viewModel: MemoViewModel, date: Date, mealType: MealType) {
        self.viewModel = viewModel
        self.date = date
        self.mealType = mealType
        if let mealMemo = viewModel.getMealMemo(for: date, mealType: mealType) {
            _temporaryTitleText = State(initialValue: mealMemo.title ?? "")
            _temporaryContentText = State(initialValue: mealMemo.content ?? "")
            if let imageData = mealMemo.image {
                _image = State(initialValue: UIImage(data: imageData))
            }
        }
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

    private var headerView: some View {
        HStack {
            Text("식단을 기록하세요")
                .font(.customFont(size: 20, weight: .bold))
            Spacer()
            Button("추가하기") {
                viewModel.saveMealMemo(for: date, mealType: mealType, image: image, title: temporaryTitleText, content: temporaryContentText)
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
    let mockModelContext = ModelContext(try! ModelContainer(for: DailyMemo.self, MealMemo.self))
    let mockViewModel = MemoViewModel(modelContext: mockModelContext)

    // 미리 몇 가지 데이터를 추가합니다
    let today = Date()
    mockViewModel.saveMealMemo(for: today, mealType: .breakfast, image: UIImage(named: "sampleBreakfast"), title: "건강한 아침", content: "오늘 아침은 그릭 요거트와 과일 샐러드")

    return MemoModalView(viewModel: mockViewModel, date: today, mealType: .lunch)
        .environmentObject(mockViewModel)
}
