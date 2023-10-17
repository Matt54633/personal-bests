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
            HStack {
                WorkoutInfoItem(data: String(workouts.count), imageName: "figure.strengthtraining.traditional")
                    .padding(.trailing, 10)
                WorkoutInfoItem(data: String(exercises.count), imageName: "figure.run")
            }
            
            Text("You've logged ^[\(workouts.count) workout](inflect: true) and ^[\(exercises.count) exercise](inflect: true)!")
                .multilineTextAlignment(.leading)
                .lineLimit(2...3)
        }
    }
}

#Preview {
    ProfileStats()
}
