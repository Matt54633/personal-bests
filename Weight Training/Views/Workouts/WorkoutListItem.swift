//
//  WorkoutListItem.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct WorkoutListItem: View {
    var workout: Workout
    
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("\(workout.category) Workout")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .fontDesign(.rounded)
                Text("\(workout.date.formattedAsDate)")
            }
            Spacer()
            HStack {
                WorkoutInfoItem(data: "\(workout.exercises.count)", imageName: "figure.run")
                    .padding(.trailing, 10)
                WorkoutInfoItem(data: "\(workout.workoutLength)", imageName: "clock.fill")
            }
        }
        .padding(.vertical, -7.5)
    }
}



//
//#Preview {
//    WorkoutListItem()
//}
