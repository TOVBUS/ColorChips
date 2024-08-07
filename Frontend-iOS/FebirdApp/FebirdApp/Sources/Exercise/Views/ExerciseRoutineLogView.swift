//
//  ExerciseRoutineLogView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI
import SwiftData

struct ExerciseRoutineLogView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @EnvironmentObject var albumViewModel : AlbumViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var image: UIImage?
    @State private var showCamera = false
    @State private var isImage = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("🎉 잘했어요! 🎉")
                    .font(.customFont(size: 24, weight: .bold))
                    .padding(.bottom, 8)

                Text("오늘의 운동을 마무리했으니")
                    .font(.customFont(size: 20, weight: .semibold))
                Text("이 순간을 사진으로 남겨볼까요?")
                    .font(.customFont(size: 20, weight: .semibold))

                Spacer()

                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical, 50)
                } else {
                    Text("💪🏻")
                        .font(.system(size: 180))
                        .padding(40)
                        .background(.gray80)
                        .cornerRadius(20)
                        .drawingGroup()
                }

                Spacer()

                VStack(spacing: 12) {
                    if isImage {
                        CustomButtonView(title: "SNS 공유하기", style: .sharing)
                        CustomButtonView(title: "다시찍기") {
                            self.showCamera = true
                        }
                        CustomButtonView(title: "저장하기") {
                            if let image = image {
                                albumViewModel.saveOrUpdateLevelRecord(routineId: 1001, levelId: 1, schoolName: "유치원", apiGrade: 1, image: image, context: modelContext)
                            }
                            navigationPathFinder.addPath(option: .exerciseGraduationView)
                        }
                    } else {
                        CustomButtonView(title: "사진찍기") {
                            self.showCamera = true
                        }
                        CustomButtonView(title: "건너뛰기") {
                            navigationPathFinder.addPath(option: .exerciseGraduationView)
                        }
                    }
                }
                .fullScreenCover(isPresented: $showCamera) {
                    CameraView(image: $image)
                }
                .onChange(of: image) { _, newImage in
                    if newImage != nil {
                        isImage = true
                    }
                }

            }
            .foregroundStyle(.gray100)
        }
    }
}

#Preview {
    ExerciseRoutineLogView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
