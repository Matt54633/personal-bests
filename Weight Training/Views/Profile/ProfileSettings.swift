//
//  ProfileSettings.swift
//  Weight Training
//
//  Created by Matt Sullivan on 13/10/2023.
//

import SwiftUI

struct ProfileSettings: View {
    @AppStorage("weightUnit") var weightUnit: String = "kg"
    @State private var selectedUnit = "kg"
    
    var body: some View {
        List {
            NavigationLink(
                destination:
                    ProfileCategories()
            ) {
                Image(systemName: "circle.grid.2x2")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundStyle(.blue)
                Text("Custom Categories")
            }
            HStack {
                Image(systemName: "scalemass.fill")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundStyle(.blue)
                Text("Unit")
                Spacer()
                Picker("Weight Unit", selection: $selectedUnit) {
                    Text("kg").tag("kg")
                    Text("lbs").tag("lbs")
                }
                .frame(width: 150)
                .pickerStyle(.segmented)
            }
            .onChange(of: selectedUnit, initial: true) { oldValue, newValue in
                if newValue != oldValue {
                    weightUnit = newValue
                }
            }
            .onAppear {
                selectedUnit = weightUnit
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    ProfileSettings()
}
