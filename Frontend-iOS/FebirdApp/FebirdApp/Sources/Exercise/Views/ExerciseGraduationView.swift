//
//  ExerciseGraduationView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI

struct ExerciseGraduationView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("졸업을 축하한다!")
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.gray100)
                    .padding(.top, 30)
                
                Image("feoPrincipal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380)
                

                
                CustomButtonView(title: "이얏호~! 졸업이다~! 🎓", style: .orange){
                    navigationPathFinder.popToRoot()
                    tabViewModel.isHidden = false
                }
            }
        }
    }
}

#Preview {
    ExerciseGraduationView()
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
