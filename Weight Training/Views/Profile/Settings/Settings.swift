//
//  ProfileSettings.swift
//  Weight Training
//
//  Created by Matt Sullivan on 13/10/2023.
//

import SwiftUI
import SwiftData

struct Settings: View {
    @AppStorage("weightUnit") var weightUnit: String = "kg"
    @State private var displaySheet: Bool = false
    @State private var selectedUnit = "kg"
    @Query private var exercises: [Exercise]
    @AppStorage("userName") var name: String = ""
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        List {
            Section(header: Text("Profile").modifier(CategoryTag())) {
                HStack {
                    HStack {
                        Text(name)
                            .font(.title)
                            .fontDesign(.rounded)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 7.5)
                        Spacer()
                        Image(systemName: "pencil.circle.fill")
                            .foregroundStyle(.yellow)
                            .font(.title2)
                    }
                }
                .onTapGesture {
                    displaySheet = true
                }
            }
            .sheet(isPresented: $displaySheet, content: {
                ProfileForm(displaySheet: $displaySheet)
            })
            
            Section(header: Text("Preferences").modifier(CategoryTag())) {
                NavigationLink(
                    destination:
                        Categories()
                ) {
                    Image(systemName: "circle.grid.2x2")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundStyle(.blue)
                    Text("Categories")
                }
                HStack {
                    Image(systemName: "scalemass.fill")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundStyle(.blue)
                    Text("Units")
                    Spacer()
                    Picker("Weight Unit", selection: $selectedUnit) {
                        Text("kg").tag("kg")
                        Text("lbs").tag("lbs")
                    }
                    .frame(width: 150)
                    .pickerStyle(.segmented)
                }
            }
            .onChange(of: selectedUnit, initial: true) { oldValue, newValue in
                if newValue != oldValue {
                    weightUnit = newValue
                    convertWeights()
                }
            }
            .onAppear {
                selectedUnit = weightUnit
            }
        }
        .navigationTitle("Settings")
    }
    
    func convertWeights() {
        if selectedUnit == "kg" {
            for exercise in exercises {
                exercise.weightLifted = Float(exercise.weightLifted / 2.20462).rounded(.towardZero)
            }
        }
        else {
            for exercise in exercises {
                exercise.weightLifted = Float(exercise.weightLifted * 2.20462).rounded(.towardZero)
            }
        }
    }
    
}

#Preview {
    Settings()
}
