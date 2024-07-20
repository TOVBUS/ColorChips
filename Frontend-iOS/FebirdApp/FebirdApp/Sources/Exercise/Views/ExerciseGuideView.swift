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
                // 운동 시작하기 버튼
            } else {
                // 챗봇에게 해당 타이틀 운동에 대한 상세 가이드 요청하기 버튼 -> 챗봇뷰로 이동
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    ExerciseGuideView()
}

