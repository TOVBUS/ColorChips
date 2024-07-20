//
//  ExerciseListView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseListView: View {

    @State private var exercises: [ExerciseItem] = [
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: true, isStarted: false),
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: false, isStarted: true),
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: false, isStarted: false)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center) {
                    Text("운동 목록")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundColor(.gray100)
                }
                .padding(.horizontal, 24)

                ForEach(exercises) { exercise in
                    ExerciseItemView(item: exercise)
                }
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    ExerciseListView()
}
