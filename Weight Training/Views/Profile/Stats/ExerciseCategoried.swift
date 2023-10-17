//
//  ExerciseCategoried.swift
//  Weight Training
//
//  Created by Matt Sullivan on 15/10/2023.
//

import SwiftUI
import SwiftData

struct ExerciseCategoried: View {
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]
    
    var body: some View {
        if !exercises.isEmpty {
            Text("Exercises by Category")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.top, 10)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                ForEach(getExerciseCategories(), id: \.self) { category in
                    let count = countExercises(in: category)
                    Text("\(category): \(count)")
                        .font(.system(size: 14))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .modifier(CategoryTag())
                }
            }
            .padding(.top, -10)
        }
    }
    
    func getExerciseCategories() -> [String] {
        return Array(Set(exercises.map { $0.category }))
    }
    
    func countExercises(in category: String) -> Int {
        return exercises.filter { $0.category == category }.count
    }
}
    
    #Preview {
        ExerciseCategoried()
    }
