//
//  WorkoutCategorised.swift
//  Weight Training
//
//  Created by Matt Sullivan on 15/10/2023.
//

import SwiftUI
import SwiftData

struct WorkoutCategorised: View {
    @Query private var workouts: [Workout]
    
    var body: some View {
        if !workouts.isEmpty {
            Text("Workouts by Category")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.top, 10)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                ForEach(getWorkoutCategories(), id: \.self) { category in
                    let count = countWorkouts(in: category)
                    Text("\(category): \(count)")
                        .font(.system(size: 14))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .modifier(CategoryTag())
                }
            }
            .padding(.top, -10)
        }
    }
    
    func getWorkoutCategories() -> [String] {
        return Array(Set(workouts.map { $0.category }))
    }
    
    func countWorkouts(in category: String) -> Int {
        return workouts.filter { $0.category == category }.count
    }
}

#Preview {
    WorkoutCategorised()
}
