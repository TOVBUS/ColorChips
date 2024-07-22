//
//  ExerciseRestTimerView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/21/24.
//

import SwiftUI

struct ExerciseRestTimerView: View {
    var body: some View {
        VStack {
            Text("휴식 타이머")
                .font(.customFont(size: 24, weight: .bold))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(.top, 60)

            Spacer()

            TimerView(viewModel: ExerciseTimerViewModel())
                .padding(.bottom, 32)

            Text("꽥꽥이님! 잘 하고 있어요!!  아주 조금만 더 힘내볼까요~?")
                .font(.customFont(size: 20, weight: .bold))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .ignoresSafeArea()

            Spacer()

            CustomButtonView(title: "휴식 중단하기", style: .warning)
                .padding(.bottom, 24)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0), Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.6)]), startPoint: .top, endPoint: .bottom))
        .background(Color(red: 0.98, green: 0.45, blue: 0.09))
        .ignoresSafeArea()
    }
}

#Preview {
    ExerciseRestTimerView()
}
