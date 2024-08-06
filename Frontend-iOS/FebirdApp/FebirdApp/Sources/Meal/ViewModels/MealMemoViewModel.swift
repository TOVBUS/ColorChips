//
//  MealMemoViewModel.swift
//  FebirdApp
//
//  Created by 이유경 on 8/7/24.
//

import SwiftUI
import SwiftData

@MainActor
class MemoViewModel: ObservableObject {
    let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func getDailyMemo(for date: Date) -> DailyMemo {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)

        let descriptor = FetchDescriptor<DailyMemo>(
            predicate: #Predicate { $0.date == startOfDay }
        )

        do {
            if let existingMemo = try modelContext.fetch(descriptor).first {
                return existingMemo
            } else {
                let newMemo = DailyMemo(date: startOfDay)
                modelContext.insert(newMemo)
                return newMemo
            }
        } catch {
            print("Failed to fetch DailyMemo: \(error)")
            let newMemo = DailyMemo(date: startOfDay)
            modelContext.insert(newMemo)
            return newMemo
        }
    }

    func saveMealMemo(for date: Date, mealType: MealType, image: UIImage?, title: String, content: String) {
        let dailyMemo = getDailyMemo(for: date)
        let imageData = image?.pngData()
        let mealMemo = MealMemo(mealType: mealType, image: imageData, title: title, content: content)

        switch mealType {
        case .breakfast:
            dailyMemo.breakfastMemo = mealMemo
        case .lunch:
            dailyMemo.lunchMemo = mealMemo
        case .dinner:
            dailyMemo.dinnerMemo = mealMemo
        }

        modelContext.insert(mealMemo)

        do {
            try modelContext.save()
        } catch {
            print("Failed to save meal memo: \(error)")
        }
    }

    func getMealMemo(for date: Date, mealType: MealType) -> MealMemo? {
        let dailyMemo = getDailyMemo(for: date)
        switch mealType {
        case .breakfast:
            return dailyMemo.breakfastMemo
        case .lunch:
            return dailyMemo.lunchMemo
        case .dinner:
            return dailyMemo.dinnerMemo
        }
    }
}
