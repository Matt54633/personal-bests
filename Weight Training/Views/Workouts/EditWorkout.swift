//
//  EditWorkout.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI

struct EditWorkout: View {
    @Environment(\.dismiss) var dismiss
    @State var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            WorkoutForm(category: $workout.category, exercises: $workout.exercises, workoutLength: $workout.workoutLength)
            Button(action: {
                dismiss()
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(workout.category.isEmpty)
            .padding()
        }
    }
}
