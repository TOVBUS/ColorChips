//
//  ExerciseGraduationView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/22/24.
//

import SwiftUI

struct ExerciseGraduationView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("graduation")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            Spacer()
            
            CustomButtonView(title: "이얏호~! 졸업이다~! 🎓", style: .orange)
        }
    }
}

#Preview {
    ExerciseGraduationView()
}
