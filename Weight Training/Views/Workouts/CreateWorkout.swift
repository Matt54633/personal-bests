//
//  CreateWorkout.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct CreateWorkout: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var category: String = "Push"
    @State private var exercises: [Exercise] = []
    @State private var workoutLength: Int = 60
    
    var body: some View {
        VStack(alignment: .leading) {
            WorkoutForm(category: $category, exercises: $exercises, workoutLength: $workoutLength)
            Button(action: {
                addWorkout(exercises: exercises, category: category, workoutLength: workoutLength, context: context)
                dismiss()
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(exercises.isEmpty || category.isEmpty)
        }
        .padding()
    }
}

//#Preview {
//    CreateWorkout()
//}
