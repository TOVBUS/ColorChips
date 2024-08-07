//
//  LevelViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI

@MainActor
class LevelViewModel: ObservableObject {
    @Published var levels: [Level] = []
    @Published var level: Level?
    @Published var errorMessage: String?

    func findAllLevels() async {
        do {
            let allLevels: [Level] = try await NetworkManager.fetch("/level", method: .get)
            levels = allLevels
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func findOneLevel(levelId: Int) async {
        do {
            let foundLevel: Level = try await NetworkManager.fetch("/level/\(levelId)", method: .get)
            level = foundLevel
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
