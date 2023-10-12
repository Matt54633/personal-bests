//
//  Item.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import Foundation
import SwiftData

@Model
final class Exercise: Identifiable {
    var id: String
    var exerciseName: String
    var weightLifted: Float
    var sets: Int
    var reps: Int
    var category: String
    var info: String?
    var creationDate: Date
    
    init(exerciseName: String, weightLifted: Float, sets: Int, reps: Int, category: String, info: String) {
        self.id = UUID().uuidString
        self.exerciseName = exerciseName
        self.weightLifted = weightLifted
        self.sets = sets
        self.reps = reps
        self.category = category
        self.info = info
        self.creationDate = Date()
    }
}

func addExercise(exerciseName: String, weightLifted: Float, sets: Int, reps: Int, category: String, info: String, context: ModelContext) {
    let exercise = Exercise(exerciseName: exerciseName, weightLifted: weightLifted, sets: sets, reps: reps, category: category, info: info)
    context.insert(exercise)
}

func deleteExercise(exercise: Exercise, context: ModelContext) {
    context.delete(exercise)
}
