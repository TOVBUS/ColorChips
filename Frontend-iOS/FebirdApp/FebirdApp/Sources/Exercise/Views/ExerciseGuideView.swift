//
//  ExerciseGuideView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseGuideView: View {
    let guideTexts = [
        "발을 어깨 너비보다 넓게 벌리고, 발끝을 바깥쪽으로 향하게 서세요.",
        "등을 곧게 펴고, 무릎이 발끝을 넘지 않도록 하며 스쿼트 자세를 취하세요.",
        "발뒤꿈치로 밀어 원래 위치로 돌아오세요."
    ]
    
    var isStarted = false
    
    var body: some View {
        VStack {
            CustomNavigationBar(title: "스모 스쿼트")
            
            VStack(alignment: .leading) {
                Text("이렇게 운동하세요 🥸")
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundColor(.gray90)
                    .padding(.vertical, 16)
                
                ExerciseGuideListView(guideTexts: guideTexts)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            
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
                    
                    CustomButtonView(title: "피오코치에게 질문할래요! 🤔")
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
