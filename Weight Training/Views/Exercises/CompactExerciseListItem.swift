//
//  CompactExerciseListItem.swift
//  Weight Training
//
//  Created by Matt Sullivan on 04/11/2023.
//

import SwiftUI

struct CompactExerciseListItem: View {
    @AppStorage("weightUnit") var weightUnit: String = ""
    var exercise: Exercise
    let formatter = NumberFormatter.decimalFormatter(decimalPlaces: 2)
    
    var body: some View {
        HStack {
            Text(exercise.exerciseName)
            Spacer()
            Text(formatWeight(exercise.weightLifted) + weightUnit)
                .font(.title2)
                .fontWeight(.bold)
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

