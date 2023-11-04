//
//  ExerciseForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI
import SwiftData

struct ExerciseForm: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("weightUnit") var weightUnit: String = ""
    @Binding var exerciseName: String
    @Binding var weightLifted: Float
    @Binding var sets: Int
    @Binding var reps: Int
    @Binding var category: String
    @Binding var info: String
    @Query private var categories: [Category]
    @Query private var exercises: [Exercise]
    @State private var displaySheet: Bool = false
    @State private var selectedExercise: Exercise?
    @State private var isNotesExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Exercise")
                        .modifier(TextInputTitle())
                    HStack {
                        TextField("e.g. Bench Press", text: $exerciseName)
                            .modifier(TextInputField())
                        Button(action: {
                            displaySheet = true
                        }) {
                            Image(systemName: "chevron.down")
                                .frame(height: 30)
                        }
                        .buttonBorderShape(.roundedRectangle(radius: 8.0))
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $displaySheet) {
                            SelectExercise(displaySheet: $displaySheet, selectedExercise: $selectedExercise)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Weight")
                        .modifier(TextInputTitle())
                    TextField("0", value: $weightLifted, format: .number)
                        .modifier(TextInputField())
                        .textFieldStyle(WeightTextFieldStyle(weightUnit: weightUnit))
                        .keyboardType(.numbersAndPunctuation)
                }
                .frame(maxWidth: .infinity)
                Spacer(minLength: 20)
                
                VStack(alignment: .leading) {
                    Text("Category")
                        .modifier(TextInputTitle())
                    Picker("Category", selection: $category) {
                        ForEach(categories.sorted(by: { $0.categoryName < $1.categoryName }), id: \.self) { category in
                            Text(category.categoryName).tag("\(category.categoryName)")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
            }
            .padding(.bottom, 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Sets")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $sets) {
                        ForEach(1..<7, content: { index in
                            Text("\(index)").tag(index)
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Reps")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $reps) {
                        ForEach(1..<19, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
            }
            .padding(.bottom, 15)
            
            
            DisclosureGroup(isExpanded: $isNotesExpanded) {
                       TextField("e.g. Drop set", text: $info)
                           .modifier(TextInputField())
               } label: {
                   Text("Notes")
                       .fontWeight(.bold)
                       .fontDesign(.rounded)
                       .font(.system(size: 17))
                       .foregroundStyle(colorScheme == .dark ? .white : .black)
               }
               .padding(.bottom, 15)
        }
        .onChange(of: info) {
            if info.isEmpty {
                isNotesExpanded = false
            } else {
                isNotesExpanded = true
            }
        }
        .onChange(of: selectedExercise) {
            if let selectedExercise = selectedExercise {
                exerciseName = selectedExercise.exerciseName
                weightLifted = selectedExercise.weightLifted
                sets = selectedExercise.sets
                reps = selectedExercise.reps
                category = selectedExercise.category
            }
        }
        .navigationTitle("Exercise")
    }
}


