//
//  ExerciseViewModel.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import SwiftUI

@MainActor
class ExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var exercise: Exercise?
    @Published var errorMessage: String?

    func findAllExercises() async {
        do {
            let allExercises: [Exercise] = try await NetworkManager.fetch("/exercise", method: .get)
            exercises = allExercises
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func findOneExercise(id: Int) async {
        do {
            let exercise: Exercise = try await NetworkManager.fetch("/exercise/\(id)", method: .get)
            self.exercise = exercise
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
