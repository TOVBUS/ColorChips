//
//  MemoRow.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI
import SwiftData

struct MemoRow: View {
    @ObservedObject var viewModel: MemoViewModel
    let date: Date
    let mealType: MealType
    @State private var showModal = false
    @State private var showFullText = false

    var body: some View {
        let mealMemo = viewModel.getMealMemo(for: date, mealType: mealType)

        HStack(spacing: 8) {
            Image(uiImage: UIImage(data: mealMemo?.image ?? Data()) ?? UIImage(named: "feoFace")!)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(mealType.rawValue)
                    .font(.customFont(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(.orange40)
                    .cornerRadius(8)

                Text(mealMemo?.title ?? "")
                    .font(.customFont(size: 17, weight: .bold))

                if let content = mealMemo?.content, !content.isEmpty {
                    Text(showFullText ? content : content.prefix(30) + (content.count > 30 ? "..." : ""))
                        .font(.customFont(size: 14, weight: .medium))
                        .foregroundStyle(.gray100)
                        .lineLimit(showFullText ? nil : 1)
                        .onTapGesture {
                            withAnimation {
                                showFullText.toggle()
                            }
                        }
                }
            }
            Spacer()

            Button(action: {
                showModal.toggle()
            }, label: {
                Image("pencilIcon")
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.gray60)
                    .padding(8)
            })
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.gray10)
        .cornerRadius(32)
        .sheet(isPresented: $showModal) {
            MemoModalView(viewModel: viewModel, date: date, mealType: mealType)
        }
    }
}

#Preview {
    let mockModelContext = ModelContext(try! ModelContainer(for: DailyMemo.self, MealMemo.self))
    let mockViewModel = MemoViewModel(modelContext: mockModelContext)

    // 미리 샘플 데이터를 추가합니다
    let today = Date()
    mockViewModel.saveMealMemo(
        for: today,
        mealType: .breakfast,
        image: UIImage(named: "sampleBreakfast")?.pngData().flatMap { UIImage(data: $0) },
        title: "건강한 아침",
        content: "오늘 아침은 그릭 요거트와 과일 샐러드로 상큼하게 시작했습니다. 영양가 높고 맛있는 식사였어요!"
    )

    return VStack {
        // 데이터가 있는 경우
        MemoRow(viewModel: mockViewModel, date: today, mealType: .breakfast)

        // 데이터가 없는 경우
        MemoRow(viewModel: mockViewModel, date: today, mealType: .lunch)
    }
    .padding()
    .background(Color.white)
    .environmentObject(mockViewModel)
}
