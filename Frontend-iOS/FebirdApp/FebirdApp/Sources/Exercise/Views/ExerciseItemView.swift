//
//  ExerciseItemView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseItemView: View {
    let item: ExerciseItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.name)
                .font(.customFont(size: 16, weight: .bold))
                .foregroundColor(foregroundColor)
                .padding(.horizontal, 14)
                .padding(.top, 8)

            Text(item.set)
                .font(.customFont(size: 14, weight: .regular))
                .foregroundColor(foregroundColor)
                .padding(.horizontal, 14)
                .padding(.bottom, 8)
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }

    private var foregroundColor: Color {
        if item.isFinished {
            return .gray30
        } else if item.isStarted {
            return .orange60
        } else {
            return .gray90
        }
    }

    private var backgroundColor: Color {
        item.isStarted ? .orange10 : .gray10
    }
}

#Preview {
    ExerciseItemView(item: ExerciseItem(name: "스모 스쿼트", set: "15회 3세트", isFinished: false, isStarted: true))
}
