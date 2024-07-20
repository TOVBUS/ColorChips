//
//  ExerciseGuideView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseGuideView: View {
    
    var isStarted = false
    
    var body: some View {
        
        VStack {
            CustomNavigationBar(title: "스모 스쿼트")
            
            Spacer()
            
            if isStarted {
                CustomButtonView(title: "시작할래요! 😉")
            } else {
                VStack(alignment: .leading) {
                    Text("이 운동에 대해 더 궁금한게 있나요?")
                        .font(.customFont(size: 14, weight: .light))
                        .foregroundStyle(.gray90)
                        .padding(.leading, 24)
                        .offset(y: 22)
                    
                    // TODO: 챗봇에게 해당 타이틀 운동에 대한 상세 가이드 요청하기 버튼
                    CustomButtonView(title: "피버 코치에게 질문할래요! 🤔") // 챗봇뷰로 이동
                }
                
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    ExerciseGuideView()
}

