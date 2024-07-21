//
//  ExerciseTimerSettingView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI

struct ExerciseTimerSettingView: View {
    
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
                VStack(alignment: .center, spacing: 10) {
                    Text(timeString(from: timerSeconds))
                        .font(.customFont(size: 80, weight: .medium, language: .english))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 180)
                        .background(.timerBackgroundDefalt)
                        .cornerRadius(50)
                    
                    HStack {
                        TimerButton(text: "-5s", isPressed: $isMinusPressed) {
                            if timerSeconds > 5 {
                                timerSeconds -= 5
                            }
                        }
                        
                        TimerButton(text: "+5s", isPressed: $isPlusPressed) {
                            timerSeconds += 5
                        }
                    }
                }
                .frame(width: 260, height: 253)
                
                Text("전신이 잘 보이도록\n카메라를 고정해주세요!")
                    .font(.customFont(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .ignoresSafeArea()
            
            // MARK: - 하단 버튼
            VStack {
                Spacer()
                
                CustomButtonView(title: "준비됐어요! 💪🏻", type: .orange)
                    .padding(24)
            }
            .ignoresSafeArea()
            .padding(24)
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
}
