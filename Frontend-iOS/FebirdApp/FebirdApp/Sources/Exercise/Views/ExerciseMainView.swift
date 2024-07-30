//
//  ExerciseMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainView: View {

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    .background(ignoresSafeAreaEdges: .top)
                
                VStack {
                    ExerciseMainHeaderView()
                    
                    ExerciseListView()
                    
                    CustomButtonView(title: "운동 시작하기")
                        .padding(.bottom, ConstantsPadding.onCustomTabBar.rawValue)
                }
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ExerciseMainView()
        .preferredColorScheme(.dark)
}
