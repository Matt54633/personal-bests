//
//  Weight_TrainingApp.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI
import SwiftData

@main
struct Weight_TrainingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.blue)
        }
        .modelContainer(for: [Exercise.self, Workout.self, Category.self])
    }
}

