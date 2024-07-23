//
//  ExerciseRecordView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ExerciseRecordView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: 160)
                    .foregroundStyle(Color.gray100)
                    .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .padding(.bottom, -60)
                
                HStack(alignment: .center) {
                    Image("Back_button")
                    Text("현재기록")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: 240, alignment: .center)
                }
                .frame(width: 343, alignment: .leading)
            }
            ExerciseRecordListView()
        }
    }
}

#Preview {
    ExerciseRecordView()
}
