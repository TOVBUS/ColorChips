//
//  ExerciseRoutineCompletionView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI

struct ExerciseRoutineCompletionView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>

    var body: some View {
        VStack {
            Text("좋아! 아주 잘 해냈군\n오늘도 한층 건강해졌는 걸?")
                .font(.customFont(size: 22, weight: .bold))
                .foregroundStyle(.gray100)
                .multilineTextAlignment(.center)
                .padding(.top, 110)

            Image("feoTA")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)

            Spacer()

            CustomButtonView(title: "오늘 루틴 끝났다!!!!!! 👊🏻👊🏻👊🏻", style: .orange) {
                navigationPathFinder.popToRoot()
                tabViewModel.isHidden = false
            }
            .padding(.bottom, 20)
        }
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ExerciseRoutineCompletionView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
