//
//  ExerciseListItem.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct ExerciseListItem: View {
    var exercise: Exercise
    let formatter = NumberFormatter.decimalFormatter(decimalPlaces: 2)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(exercise.exerciseName)
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                }
                HStack {
                    Text("Sets: \(exercise.sets)")
                    Text("Reps: \(exercise.reps)")
                }
            }
            Spacer()
            Text("\(formatter.string(from: NSNumber(value: exercise.weightLifted)) ?? "Nil")kg")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .fontDesign(.rounded)
                .foregroundStyle(.blue)
        }
    }
}

//#Preview {
//    ExerciseListItem()
//}
