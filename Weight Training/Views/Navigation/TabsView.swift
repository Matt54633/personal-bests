//
//  TabView.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI

struct TabsView: View {
    @Environment(\.modelContext) private var context
    @AppStorage("userName") var name: String = ""
    @AppStorage("weightUnit") var weightUnit: String = ""

    var body: some View {
        TabView {
            PersonalBestList()
                .tabItem {
                    Label("Bests", systemImage: "dumbbell.fill")
                        .foregroundStyle(.blue)
                }
            WorkoutList()
                .tabItem {
                    Label("Workouts", systemImage: "figure.strengthtraining.traditional")
                        .foregroundStyle(.blue)
                }
            AllExercises()
                .tabItem {
                    Label("Exercises", systemImage: "figure.run")
                        .foregroundStyle(.blue)
                }
            ProfileView()
                .tabItem {
                    if !name.isEmpty {
                        Label(name, systemImage: "person.fill")
                            .foregroundStyle(.blue)
                    } else {
                        Label("Profile", systemImage: "person.fill")
                            .foregroundStyle(.blue)
                    }
                }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "DefaultCategoriesPublished") {
                publishDefaultData()
                UserDefaults.standard.set(true, forKey: "DefaultCategoriesPublished")
            }
        }
    }
    
    func publishDefaultData() {
        weightUnit = "kg"

        let categories = ["Push", "Pull", "Lower", "Upper", "Chest", "Back", "Legs", "Biceps", "Core", "Cardio", "Triceps", "Shoulders"]
        for categoryName in categories {
            addCategory(categoryName: categoryName, context: context)
        }
    }
}
//
//#Preview {
//    TabView()
//}
