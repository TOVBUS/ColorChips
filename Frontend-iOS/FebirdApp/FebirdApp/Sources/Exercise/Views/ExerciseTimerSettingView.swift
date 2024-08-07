//
//  ExerciseTimerSettingView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI

struct ExerciseTimerSettingView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @State private var timerSeconds: Int = 10
    @State private var isMinusPressed = false
    @State private var isPlusPressed = false
    @StateObject private var exerciseDetector = ExerciseDetector()
    @State private var selectedExercise: ExerciseType = .sumoSquat
    @State private var totalCount: Int = 3
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // MARK: - 카메라 가이드 사진
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 455, height: 812)
                .background(
                    Image("CameraSettingGuide")
                        .resizable()
                        .scaledToFit()
                )
                .ignoresSafeArea()

            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0), Color(red: 0.07, green: 0.07, blue: 0.08)]), startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea()

            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 455, height: 812)
                .background(
                    Image("CameraSettingGuideLine")
                )
                .ignoresSafeArea()
                .padding(24)

            // MARK: - 메인 컨텐츠
            VStack {
                TimerView(viewModel: ExerciseTimerViewModel())

                Text("전신이 잘 보이도록\n카메라를 고정해주세요!")
                    .font(.customFont(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .ignoresSafeArea()

            // MARK: - 하단 버튼
            VStack {
                Spacer()

                CustomButtonView(title: "준비됐어요! 💪🏻", style: .orange) {
                    cameraCheckAndProceed()
                }
                .padding(24)
                .padding(.bottom, 10)
            }
            .ignoresSafeArea()
            .padding(24)
            .onAppear {
                tabViewModel.isHidden = true
                exerciseDetector.currentExercise = selectedExercise
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    exerciseDetector.checkCameraPermission()
                }
            }
        }
        .ignoresSafeArea()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("카메라 권한 필요"),
                message: Text("이 앱은 카메라 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요."),
                primaryButton: .default(Text("설정으로 이동")) {
                    if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsUrl)
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .onChange(of: exerciseDetector.cameraPermissionStatus) { _, newValue in
            if newValue == .denied {
                showAlert = true
            }
        }
        .navigationBarBackButtonHidden()
    }

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }

    private func cameraCheckAndProceed() {
        exerciseDetector.checkCameraPermission()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if exerciseDetector.cameraPermissionStatus == .authorized {
                navigationPathFinder.addPath(option: .exerciseCountView(ExerciseDetector(), .sumoSquat, 3))

            } else {
                showAlert = true
            }
        }
    }
}

#Preview {
    ExerciseTimerSettingView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
