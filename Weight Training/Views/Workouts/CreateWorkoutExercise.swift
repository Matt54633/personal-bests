//
//  CreateWorkoutExercise.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct CreateWorkoutExercise: View {
    @State private var exerciseName: String = ""
    @State private var weightLifted: Float = 0
    @State private var sets: Int = 3
    @State private var reps: Int = 12
    @State private var category: String = ""
    @State private var info: String = ""
    @Binding var exercises: [Exercise]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            ExerciseForm(exerciseName: $exerciseName, weightLifted: $weightLifted, sets: $sets, reps: $reps, category: $category, info: $info)
            Button(action: {
                exercises.append(Exercise(exerciseName: exerciseName, weightLifted: weightLifted, sets: sets, reps: reps, category: category, info: info))
                dismiss()
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(exerciseName.isEmpty || category.isEmpty)
        }
        .onAppear {
            category = "Chest"
        }
        .padding()
    }
}

//#Preview {
//    CreateWorkoutExercise()
//}
