//
//  ExerciseCategories.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import Foundation

class ExerciseCategories: ObservableObject {
    @Published var all: [String] = ["Chest", "Back", "Legs", "Biceps", "Core", "Cardio", "Triceps", "Shoulders"]
}
