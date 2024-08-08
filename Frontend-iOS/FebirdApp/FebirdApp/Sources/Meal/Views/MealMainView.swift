//
//  MealMainView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI
import SwiftData

struct MealMainView: View {
    @EnvironmentObject var mealNavigationPathFinder: NavigationPathFinder<MealViewOptions>
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: MemoViewModel
    @State private var selectedDate = Date()
    @State private var needsRefresh = false

    init() {
        let context = ModelContext(try! ModelContainer(for: DailyMemo.self, MealMemo.self))
        _viewModel = StateObject(wrappedValue: MemoViewModel(modelContext: context))
    }

    var body: some View {
        VStack {
            MealMainheaderView(selectedDate: $selectedDate)

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("AI 식단추천")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                        .padding(.horizontal, 25)

                    AIMealRecomendationView()

                    Text("식단 기록")
                        .foregroundStyle(.gray100)
                        .font(.customFont(size: 20, weight: .bold))
                        .padding(.horizontal, 25)

                    ForEach(MealType.allCases, id: \.self) { mealType in
                        MemoRow(viewModel: viewModel, date: selectedDate, mealType: MealType(rawValue: mealType.rawValue) ?? mealType)
                    }.padding(.horizontal, 25)
                }
            }
            .padding(.bottom, ConstantsPadding.mealMainOnCustomTabBar.rawValue)
        }
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
        .environmentObject(mealNavigationPathFinder)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("MealMemoUpdated"))) { _ in
            needsRefresh.toggle()
        }
        .id(needsRefresh)
    }
}

#Preview {
    MealMainView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<MealViewOptions>())
}
