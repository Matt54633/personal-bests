//
//  CompactExerciseListItem.swift
//  Weight Training
//
//  Created by Matt Sullivan on 06/10/2023.
//

import SwiftUI

struct WorkoutExerciseListItem: View {
    @AppStorage("weightUnit") var weightUnit: String = ""
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
            Text(formatWeight(exercise.weightLifted) + weightUnit)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .fontDesign(.rounded)
                .foregroundStyle(.blue)
        }
        if let exerciseInfo = exercise.info {
            if exerciseInfo != "" {
                Text(exerciseInfo)
            }
        }
    }
    
    func formatWeight(_ weight: Float) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = weight.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 1
        return numberFormatter.string(from: NSNumber(value: weight)) ?? "Nil"
    }
}

//#Preview {
//    CompactExerciseListItem()
//}
