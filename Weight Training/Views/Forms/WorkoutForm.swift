//
//  WorkoutForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI
import SwiftData

struct WorkoutForm: View {
    @Binding var category: String
    @Binding var exercises: [Exercise]
    @Binding var workoutLength: Int
    @Query private var categories: [Category]
    @Environment(\.colorScheme) var colorScheme
    @State private var lengths: [Int] = [15, 30, 45, 60, 75, 90, 105, 120]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Category")
                        .modifier(TextInputTitle())
                    Picker("Category", selection: $category) {
                        ForEach(categories.sorted(by: { $0.categoryName < $1.categoryName }), id: \.self) { category in
                            Text(category.categoryName).tag("\(category.categoryName)")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                }
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Session Length")
                        .modifier(TextInputTitle())
                    Picker("Session Length", selection: $workoutLength) {
                        ForEach(lengths, id: \.self) { length in
                            Text("\(length) minutes").tag(length)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                }
                
            }
            .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            HStack {
                Text("Exercises")
                    .font(.title3)
                    .modifier(TextInputTitle())
                Spacer()
                NavigationLink(destination: CreateWorkoutExercise(exercises: $exercises)) {
                    Image(systemName: "plus")
                        .frame(width: 20, height: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .font(.title3)
                .modifier(CategoryTag())
            }
            .padding(.bottom, -6)
            .padding(.horizontal)
        List {
            ForEach(exercises, id: \.self) { exercise in
                NavigationLink(
                    destination:
                        EditExercise(exercise: exercise)
                ) {
                    WorkoutExerciseListItem(exercise: exercise)
                }
            }
            .onDelete { indexSet in
                exercises.remove(atOffsets: indexSet)
            }
        }
        
    }
        .listStyle(.plain)
        .navigationTitle("Workout")
}
}
