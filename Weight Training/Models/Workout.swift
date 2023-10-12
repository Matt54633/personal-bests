//
//  Workout.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import Foundation
import SwiftData

@Model
final class Workout: Identifiable {
    var id: String
    var date: Date
    var exercises: [Exercise]
    var category: String
    var workoutLength: Int
    
    init(exercises: [Exercise], category: String, workoutLength: Int) {
        self.id = UUID().uuidString
        self.date = Date()
        self.exercises = exercises
        self.category = category
        self.workoutLength = workoutLength
    }
}

func addWorkout(exercises: [Exercise], category: String, workoutLength: Int, context: ModelContext) {
    let workout = Workout(exercises: exercises, category: category, workoutLength: workoutLength)
    context.insert(workout)
}

func deleteWorkout(workout: Workout, context: ModelContext) {
    context.delete(workout)
}
