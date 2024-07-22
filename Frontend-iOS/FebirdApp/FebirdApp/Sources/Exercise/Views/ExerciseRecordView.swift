//
//  ExerciseRecordView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ExerciseRecordView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(height: 160)
                    .foregroundStyle(Color.gray100)
                    .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                ExerciseRecordListView()
            }
            .navigationTitle("현재기록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExerciseRecordView()
}
