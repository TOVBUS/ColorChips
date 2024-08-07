//
//  ExerciseListView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseListView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @State private var isStarted = false

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
                        .onTapGesture {
                            exercises[0].isStarted = true
                            navigationPathFinder.addPath(option: .exerciseGuideView(isStarted: isStarted))
                        }
                }
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    ExerciseListView()
}
