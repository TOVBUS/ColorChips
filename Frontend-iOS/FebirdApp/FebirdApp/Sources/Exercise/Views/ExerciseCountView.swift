//
//  ExerciseCountView.swift
//  FebirdApp
//
//  Created by 이유경 on 8/4/24.
//

import SwiftUI

struct ExerciseCountView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    var body: some View {
        VStack {
            Text("여기여기")
            
            CustomButtonView(title: "다음", style: .orange) {
                navigationPathFinder.addPath(option: .exerciseRestTimerView)
            }
        }
    }
}

#Preview {
    ExerciseCountView()
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
