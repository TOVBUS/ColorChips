//
//  ExerciseRecordListView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ExerciseRecordListView: View {
    let schools = ["유치원", "초등학교", "중학교"]
    let schoolGrades = [3, 6, 3] // 각 학교의 학년 수
    let kindergarden = ["씨앗반", "새싹반", "열매반"]
    let gauge = [8, 4, 0]

    @State private var expandedSchools: Set<Int> = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<schools.count, id: \.self) { index in
                    VStack {
                        schoolButton(for: index)

                        if expandedSchools.contains(index) {
                            gradeGrid(for: index)
                        }
                    }
                }
            }
            .padding()
        }
    }

    private func schoolButton(for index: Int) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                if expandedSchools.contains(index) {
                    expandedSchools.remove(index)
                } else {
                    expandedSchools.insert(index)
                }
            }
        }) {
            HStack(spacing: 7) {
                Image("feoFace")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)

                VStack(alignment: .leading) {
                    Text(" \(schools[index])")
                        .font(.customFont(size: 19, weight: .medium))
                        .foregroundStyle(.gray100)
                    OnboardingGaugeView(progress: gauge[index])
                        .padding(.vertical, -30)
                        .padding(.horizontal, -20)
                }

                Image(gauge[index] == 8 ? "Badge_color" : "Badge_gray")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(.gray10)
            .cornerRadius(32)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
        }
    }

    private func gradeGrid(for schoolIndex: Int) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
            ForEach(1...schoolGrades[schoolIndex], id: \.self) { num in
                gradeItem(schoolIndex: schoolIndex, num: num)
            }
        }
        .padding()
        .background(Color.gray10)
        .cornerRadius(24)
    }

    private func gradeItem(schoolIndex: Int, num: Int) -> some View {
        VStack {
            Image("SolidFire")
                .resizable()
                .frame(width: 40, height: 40)
            if schools[schoolIndex] == "유치원" {
                Text(kindergarden[num-1])
                    .font(.customFont(size: 17, weight: .medium))
            }
            else {
                Text("\(num)학년")
                    .font(.customFont(size: 18, weight: .medium))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 24)
        .frame(width: 80, height: 95)
        .foregroundStyle(.gray50)
        .background(.white)
        .cornerRadius(24)
    }
}

#Preview {
    ExerciseRecordListView()
}
