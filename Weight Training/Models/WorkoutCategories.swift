//
//  WorkoutCategories.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import Foundation

class WorkoutCategories: ObservableObject {
    @Published var all: [String] = ["Push", "Pull", "Legs", "Core", "Cardio", "Lower", "Upper"]
}

