//
//  ExerciseForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI

struct ExerciseForm: View {
    @Environment(\.modelContext) private var context

    @Binding var displaySheet: Bool
    @State private var exerciseName: String = ""
    @State private var weightLifted: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var category: String = ""
    var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title) Exercise")
                .modifier(TitleText())
            
            VStack(alignment: .leading) {
                Text("Exercise Name:")
                    .modifier(TextInputTitle())
                TextField("", text: $exerciseName)
                    .modifier(TextInputField())
            }
            .padding(.bottom, 20)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Weight:")
                        .modifier(TextInputTitle())
                    TextField("", text: $weightLifted)
                        .modifier(TextInputField())
                }
                .padding(.bottom, 20)
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Sets:")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $sets) {
                        ForEach(1..<7, content: { index in
                            Text("\(index)")
                        })
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                }
                .padding(.bottom, 20)
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Reps:")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $reps) {
                        ForEach(3..<19, content: { index in
                            Text("\(index)")
                        })
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                }
                .padding(.bottom, 20)
            }
            VStack(alignment: .leading) {
                Text("Category:")
                    .modifier(TextInputTitle())
                TextField("", text: $category)
                    .modifier(TextInputField())
            }
            .padding(.bottom, 20)
            Button(action: {
                addExercise(exerciseName: exerciseName, weightLifted: weightLifted, sets: sets, reps: reps, category: category, context: context)
                displaySheet = false
            }) {
                Text("Save")
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .padding()
    }
}
//
//#Preview {
//    ExerciseForm()
//}
