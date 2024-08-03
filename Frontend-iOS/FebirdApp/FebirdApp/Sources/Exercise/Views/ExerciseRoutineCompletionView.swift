//
//  ExerciseRoutineCompletionView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI

struct ExerciseRoutineCompletionView: View {
    var body: some View {
        VStack {
            Text("좋아! 아주 잘 해냈군\n오늘도 한층 건강해졌는 걸?")
                .font(.customFont(size: 22, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 120)

            Image("feoTA")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)

            Spacer()

            CustomButtonView(title: "오늘 루틴 끝났다!!!!!! 👊🏻👊🏻👊🏻", style: .orange)
        }
    }
}

#Preview {
    ExerciseRoutineCompletionView()
}
