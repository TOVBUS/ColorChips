//
//  ExerciseRoutineLogView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI

struct ExerciseRoutineLogView: View {
    var body: some View {
        VStack {
            VStack {
                Text("🎉 잘했어요! 🎉")
                    .font(.customFont(size: 24, weight: .bold))
                    .padding(.bottom, 8)
                
                Text("오늘의 운동을 마무리했으니")
                    .font(.customFont(size: 20, weight: .semibold))
                Text("이 순간을 사진으로 남겨볼까요?")
                    .font(.customFont(size: 20, weight: .semibold))
            }
            
            Spacer()
            
            // TODO: 이미지가 추가되면 Text가 아닌 Image로 보여줘야함
            Text("💪🏻")
                .font(.system(size: 180))
                .padding(40)
                .background(.gray80)
                .cornerRadius(20)
                .drawingGroup()
            
            Spacer()
            
            VStack(spacing: 12) {
                CustomButtonView(title: "SNS 공유하기", style: .sharing)
                CustomButtonView(title: "사진찍기")
                CustomButtonView(title: "건너뛰기")
            }
            
        }
    }
}

#Preview {
    ExerciseRoutineLogView()
}
