//
//  ProfileSettings.swift
//  Weight Training
//
//  Created by Matt Sullivan on 13/10/2023.
//

import SwiftUI
import SwiftData

struct Settings: View {
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("weightUnit") var weightUnit: String = "kg"
    @AppStorage("userName") var name: String = ""
    @Query private var exercises: [Exercise]
    @State private var selectedUnit = "kg"
    
    var body: some View {
        List {
            Section(header: Text("Profile").modifier(CategoryTag())) {
                HStack {
                    HStack {
                        TextField("What's your name?", text: $name)
                            .font(.title)
                            .fontDesign(.rounded)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 7.5)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Image(systemName: "pencil.circle.fill")
                            .foregroundStyle(.yellow)
                            .font(.title2)
                    }
                }
            }
            
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
