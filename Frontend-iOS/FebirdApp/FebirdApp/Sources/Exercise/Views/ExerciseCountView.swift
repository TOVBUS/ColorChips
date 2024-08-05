//
//  ExerciseCountView.swift
//  FebirdApp
//
//  Created by 이유경 on 8/4/24.
//

import SwiftUI
import Vision
import AVFoundation

struct ExerciseCountView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @StateObject var exerciseDetector: ExerciseDetector
    @State var selectedExercise: ExerciseType
    @State var totalCount: Int
    @State private var showAlert = false

    var body: some View {
        GeometryReader { _ in
            ZStack {
                ZStack {
                    if let previewLayer = exerciseDetector.previewLayer {
                        CameraPreview(previewLayer: previewLayer)
                    }
                    JointOverlayView(exerciseDetector: exerciseDetector)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(height: 52)
                            .cornerRadius(10)

                        HStack {
                            Spacer()
                            Text("\(selectedExercise) - \(exerciseDetector.exerciseStateString)")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(exerciseDetector.count) / \(totalCount)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding(.top, 14)
                    .padding(.horizontal, 20)

                    HStack {
                        Spacer()
                        Button {
                            exerciseDetector.resetExerciseState()
                        } label: {
                            Image("refreshButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .padding(10)
                    }
                    .padding(.trailing, 10)

                    Spacer()

                    Button(action: {
                        exerciseDetector.toggleDetection()
                    }) {
                        Text(exerciseDetector.isDetecting ? "포기할래요 😭" : "다시 시작하기")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(minHeight: 56)
                            .background(exerciseDetector.isDetecting ? Color.black : Color.green)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            exerciseDetector.currentExercise = selectedExercise
            exerciseDetector.startDetecting()
        }
        .onDisappear {
            exerciseDetector.stopDetecting()
        }
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
        .onChange(of: exerciseDetector.count) { _, newCount in
            if newCount == totalCount {
                navigationPathFinder.addPath(option: .exerciseRestTimerView)
            }
        }
    }
}

#Preview {
    ExerciseCountView(exerciseDetector: ExerciseDetector(), selectedExercise: .sumoSquat, totalCount: 3)
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
