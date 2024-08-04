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
                    // TODO: 운동 카운트 화면으로 이동
                    navigationPathFinder.addPath(option: .exerciseCountView)
                }
                    .padding(24)
            }
            .ignoresSafeArea()
            .padding(24)
            .onAppear {
                tabViewModel.isHidden = true
            }
        }
        .ignoresSafeArea()
    }

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

#Preview {
    ExerciseTimerSettingView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
