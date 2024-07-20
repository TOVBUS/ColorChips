//
//  ExerciseMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .ignoresSafeArea()
            
            VStack {
                ExerciseMainHeaderView()
                
                ExerciseListView()
                
                CustomButtonView(title: "운동 시작하기")
                    .padding(.bottom, 12)
                
                CustomTabBarView()
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
