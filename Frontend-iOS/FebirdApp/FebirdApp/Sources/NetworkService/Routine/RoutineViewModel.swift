//
//  RoutineViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI

@MainActor
class RoutineViewModel: ObservableObject {
    @Published var routines: [Routine] = []
    @Published var routine: Routine?
    @Published var errorMessage: String?

    func findAllRoutines() async {
        do {
            let allRoutines: [Routine] = try await NetworkManager.fetch("/routine", method: .get)
            routines = allRoutines
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func findOneRoutine(routineId: Int) async {
        do {
            let foundRoutine: Routine = try await NetworkManager.fetch("/routine/\(routineId)", method: .get)
            routine = foundRoutine
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
