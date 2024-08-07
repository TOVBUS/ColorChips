//
//  ExerciseMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @State private var isStarted = true

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .ignoresSafeArea()

            VStack {
                ExerciseMainHeaderView()

                ExerciseListView()

                CustomButtonView(title: "운동 시작하기") {
                    navigationPathFinder.addPath(option: .exerciseGuideView(isStarted: isStarted))
                }

            }
            .padding(.bottom, ConstantsPadding.mealMainOnCustomTabBar.rawValue)
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ExerciseMainView()
        .preferredColorScheme(.dark)
}
