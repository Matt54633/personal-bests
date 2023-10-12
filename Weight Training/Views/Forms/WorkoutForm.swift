//
//  WorkoutForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI

struct WorkoutForm: View {
    @Binding var category: String
    @Binding var exercises: [Exercise]
    @Binding var workoutLength: Int
    
    @StateObject private var workoutCategories = WorkoutCategories()
    @State private var lengths: [Int] = [15, 30, 45, 60, 75, 90, 105, 120]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Category:")
                    .modifier(TextInputTitle())
                Picker("Category:", selection: $category) {
                    ForEach(workoutCategories.all, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .frame(maxWidth: .infinity)
                .pickerStyle(.menu)
                .modifier(TextInputField())
            }
            Spacer(minLength: 20)
            VStack(alignment: .leading) {
                Text("Session Length:")
                    .modifier(TextInputTitle())
                Picker("Session Length:", selection: $workoutLength) {
                    ForEach(lengths, id: \.self) { length in
                        Text("\(length) minutes").tag(length)
                    }
                }
                .frame(maxWidth: .infinity)
                .pickerStyle(.menu)
                .modifier(TextInputField())
            }
            
        }
        .padding(.bottom, 20)
        VStack() {
            HStack {
                Text("Exercises:")
                    .modifier(TextInputTitle())
                Spacer()
                NavigationLink(
                    destination:
                        CreateWorkoutExercise(exercises: $exercises)
                ) {
                    Image(systemName: "plus")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundStyle(.blue)
                }
            }
            Divider()
            if !exercises.isEmpty {
                List {
                    ForEach(exercises, id: \.self) { exercise in
                        NavigationLink(
                            destination:
                                EditExercise(exercise: exercise)
                        ) {
                            ExerciseListItem(exercise: exercise)
                                .padding(.bottom, 12)
                        }
                    }
                    .onDelete { indexSet in
                        exercises.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Workout")
        .padding(.bottom, 25)
        Spacer()
    }
}

//#Preview {
//    WorkoutForm()
//}
