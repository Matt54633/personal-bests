//
//  ProfileStats.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI
import SwiftData
struct ProfileStats: View {
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]
    @Query private var workouts: [Workout]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                
                Text("Stats")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundStyle(.blue)
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                    .font(.title2)
                    .foregroundStyle(.primary)
            }
            .padding(.top, 5)
            .padding(.bottom, -2.5)
            Divider()
            
            HStack {
                WorkoutInfoItem(data: String(workouts.count), imageName: "figure.strengthtraining.traditional")
                    .padding(.trailing, 10)
                WorkoutInfoItem(data: String(exercises.count), imageName: "figure.run")
            }
            
            Text("You've logged ^[\(workouts.count) workout](inflect: true) and ^[\(exercises.count) exercise](inflect: true)!")
                .multilineTextAlignment(.leading)
                .lineLimit(2...3)
            
            Divider()
            
            if !workouts.isEmpty {
                Text("Workouts by Category:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.top, 5)
                
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
            
            if !exercises.isEmpty {
                Text("Exercises by Category:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.top, 5)
                
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
    }
    
    
    func getWorkoutCategories() -> [String] {
        return Array(Set(workouts.map { $0.category }))
    }
    
    func countWorkouts(in category: String) -> Int {
        return workouts.filter { $0.category == category }.count
    }
    
    func getExerciseCategories() -> [String] {
        return Array(Set(exercises.map { $0.category }))
    }
    
    func countExercises(in category: String) -> Int {
        return exercises.filter { $0.category == category }.count
    }
}

#Preview {
    ProfileStats()
}
