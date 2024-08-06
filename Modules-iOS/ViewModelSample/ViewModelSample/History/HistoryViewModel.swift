//
//  HistoryViewModel.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI
/*
class HistoryViewModel: ObservableObject {
    private let useCase: HistoryUseCase
    @Published var histories: [History] = []
    @Published var selectedHistory: History?
    @Published var error: Error?
    
    init(useCase: HistoryUseCase = HistoryUseCase()) {
        self.useCase = useCase
    }
    
    func createHistory(_ newHistory: History) {
        Task {
            do {
                let createdHistory = try await useCase.createHistory(newHistory)
                await MainActor.run {
                    self.histories.append(createdHistory)
                }
            } catch {
                await MainActor.run {
                    self.error = error
                }
            }
        }
    }
    
    func getHistory(id: Int) {
        Task {
            do {
                let history = try await useCase.getHistory(id: id)
                await MainActor.run {
                    self.selectedHistory = history
                }
            } catch {
                await MainActor.run {
                    self.error = error
                }
            }
        }
    }
}
*/
