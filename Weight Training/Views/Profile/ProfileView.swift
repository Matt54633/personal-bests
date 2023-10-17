//
//  ProfileView.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @State private var displaySheet: Bool = false
    @AppStorage("userName") var userName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section(header: Text("Stats").modifier(CategoryTag())) {
                        OverallStats()
                    }
                    Section {
                        WorkoutCategorised()
                            .listRowSeparator(.hidden)
                    }
                    Section {
                        ExerciseCategoried()
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .sheet(isPresented: $displaySheet, content: {
                ProfileForm(displaySheet: $displaySheet)
            })
            .onAppear {
                if userName.isEmpty {
                    displaySheet = true
                }
            }
            .navigationTitle(Text("Hey \(userName)!"))
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination:
                            Settings()
                    ) {
                        Image(systemName: "gear")
                    }
                    .modifier(BlueButtonStyle())
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

