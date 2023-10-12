//
//  WorkoutListViewModel.swift
//  Weight Training
//
//  Created by Matt Sullivan on 11/10/2023.
//

import SwiftUI

@MainActor class WorkoutListViewModel: ObservableObject {
    @Published var selectedMonth: String = "All"
    @Published var workouts: [Workout] = []
    
    var categories: [String] {
        Array(Set(workouts.map { $0.category }))
    }
    
    func uniqueMonths() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return Array(Set(workouts.map { dateFormatter.string(from: $0.date) }))
    }
    
    func filteredWorkouts(forCategory category: String) -> [Workout] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        let filteredWorkouts = workouts
            .filter { workout in
                let workoutMonth = dateFormatter.string(from: workout.date)
                return (selectedMonth == "All" || workoutMonth == selectedMonth) &&
                    workout.category == category
            }
            .sorted { $0.date > $1.date }
        
        return filteredWorkouts
    }
}
