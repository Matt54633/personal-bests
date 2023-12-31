//
//  CreateExercise.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI
import WidgetKit

struct CreateExercise: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var exerciseName: String = ""
    @State private var weightLifted: Float = 0
    @State private var sets: Int = 3
    @State private var reps: Int = 12
    @State private var category: String = "Chest"
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
                addExercise(exerciseName: exerciseName, weightLifted: weightLifted, sets: sets, reps: reps, category: category, info: info, context: context)
                WidgetCenter.shared.reloadAllTimelines()
                dismiss()
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(exerciseName.isEmpty || category.isEmpty)
        }
        .padding()
    }
}
//
//#Preview {
////    CreateExercise(displaySheet: $displaySheet)
//}
