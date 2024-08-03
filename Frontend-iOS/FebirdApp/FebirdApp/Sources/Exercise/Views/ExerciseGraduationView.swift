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
        VStack {
            Text("졸업을 축하한다!")
                .font(.customFont(size: 22, weight: .bold))
                .padding(.top, 80)
            
            ZStack {
                Image("feoPrincipal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330)
                    .padding(.bottom, 230)
                    .padding(.top, -50)
                ZStack{
                    Image("Diploma")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 284, height: 480)
                        .padding(.bottom, -170)
                }
            }
            
            Spacer()
            
            CustomButtonView(title: "이얏호~! 졸업이다~! 🎓", style: .orange){
                navigationPathFinder.popToRoot()
                tabViewModel.isHidden = false
            }
        }
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    ExerciseGraduationView()
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
