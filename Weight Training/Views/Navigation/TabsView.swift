//
//  TabView.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI

struct TabsView: View {
    @AppStorage("userName") var name: String = ""
    
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
    }
}
//
//#Preview {
//    TabView()
//}
