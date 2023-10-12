//
//  EditExercise.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct EditExercise: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var exercise: Exercise
    @State private var exerciseName: String = ""
    @State private var weightLifted: Float = 0
    @State private var sets: Int = 0
    @State private var reps: Int = 0
    @State private var category: String = ""
    @State private var info: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            ExerciseForm(
                exerciseName: $exerciseName,
                weightLifted: $weightLifted,
                sets: $sets,
                reps: $reps,
                category: $category,
                info: $info
            )
            Button(action: {
                editExercise(exercise: exercise)
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .disabled(exerciseName.isEmpty || category.isEmpty)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
        .onAppear {
            exerciseName = exercise.exerciseName
            weightLifted = exercise.weightLifted
            sets = exercise.sets
            reps = exercise.reps
            category = exercise.category
            if let infoString = exercise.info {
                info = infoString
            }
        }
        .padding()
    }
    
    func editExercise(exercise: Exercise) {
        exercise.exerciseName = exerciseName
        exercise.weightLifted = weightLifted
        exercise.sets = sets
        exercise.reps = reps
        exercise.category = category
        exercise.info = info
        
        dismiss()
    }
}

//#Preview {
//    EditExercise()
//}
