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
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                }
                HStack {
                    Text("Sets: \(exercise.sets)")
                    Text("Reps: \(exercise.reps)")
                }
                .font(.system(size: 15))
                if let exerciseInfo = exercise.info {
                    if exerciseInfo != "" {
                        Text("Notes: \(exerciseInfo)")
                            .font(.system(size: 15))
                    }
                }
            }
            Spacer()
            Text(formatWeight(exercise.weightLifted) + weightUnit)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .fontDesign(.rounded)
                .foregroundStyle(.blue)
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
