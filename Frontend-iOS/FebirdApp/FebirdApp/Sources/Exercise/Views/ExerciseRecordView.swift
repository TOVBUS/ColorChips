//
//  ExerciseRecordView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ExerciseRecordView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: 160)
                    .foregroundStyle(.gray100)
                    .cornerRadius(34, corners: [.bottomLeft, .bottomRight])

                    Text("현재기록")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 30)
            }
            ExerciseRecordListView()
        }
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
        .onAppear {
            tabViewModel.isHidden = true
        }
        .onDisappear {
            tabViewModel.isHidden = false
        }
    }
}

#Preview {
    ExerciseRecordView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())
}
