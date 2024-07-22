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
            Spacer()
            
            Image("ddabong")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 260)
            
            Spacer()
            
            CustomButtonView(title: "오늘 루틴 끝났다!!!!!! 👊🏻👊🏻👊🏻", style: .orange)
        }
    }
}

#Preview {
    ExerciseRoutineCompletionView()
}
