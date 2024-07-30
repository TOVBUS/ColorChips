//
//  ExerciseGuideListView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseGuideListView: View {
    let guideTexts: [String]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(guideTexts.indices, id: \.self) { index in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1).")
                            .font(.customFont(size: 16, weight: .bold))
                            .frame(width: 20, alignment: .leading)

                        Text(guideTexts[index])
                            .font(.customFont(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseGuideListView(guideTexts: [
        "발을 어깨 너비보다 넓게 벌리고, 발끝을 바깥쪽으로 향하게 서세요.",
        "등을 곧게 펴고, 무릎이 발끝을 넘지 않도록 하며 스쿼트 자세를 취하세요.",
        "발뒤꿈치로 밀어 원래 위치로 돌아오세요."
    ])
}
