//
//  ProfileStats.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI
import SwiftData
struct OverallStats: View {
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]
    @Query private var workouts: [Workout]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Totals")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.top, 5)
            
            HStack {
                WorkoutInfoItem(data: String(workouts.count), imageName: "figure.strengthtraining.traditional")
                    .padding(.trailing, 10)
                WorkoutInfoItem(data: String(exercises.count), imageName: "figure.run")
            }
            .padding(.top, -12.5)
            .padding(.bottom, -5)
            
//            Text("^[\(workouts.count) workout](inflect: true) and ^[\(exercises.count) exercise](inflect: true) so far!")
//                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    OverallStats()
}
