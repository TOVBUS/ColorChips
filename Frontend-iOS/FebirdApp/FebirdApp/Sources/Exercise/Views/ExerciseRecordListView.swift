//
//  ExerciseRecordListView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ExerciseRecordListView: View {
    let school = ["유치원", "초등학교", "중학교"]
    var body: some View {
        HStack(spacing: 10) {
            Image("BigfaceFeo")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)

            VStack(alignment: .leading) {
                Text("유치원")
                    .font(.customFont(size: 18, weight: .medium))
                OnboardingGaugeView(progress: 10)
                    .padding(.horizontal, -40)
            }
            // 메달 이미지 교체
            Image("BigfaceFeo")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)

        }
        .frame(width: .infinity, height: 100)
        .background(.gray10)
        .cornerRadius(32)
        .padding(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
    }
}

#Preview {
    ExerciseRecordListView()
}
