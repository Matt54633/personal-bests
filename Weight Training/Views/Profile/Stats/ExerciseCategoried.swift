//
//  ExerciseCategoried.swift
//  Weight Training
//
//  Created by Matt Sullivan on 15/10/2023.
//

import SwiftUI

struct ExerciseCategoried: View {
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExerciseCategoried()
}
