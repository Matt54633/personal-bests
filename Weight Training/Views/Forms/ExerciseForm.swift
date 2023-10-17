//
//  ExerciseForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI
import SwiftData

struct ExerciseForm: View {
    @Binding var exerciseName: String
    @Binding var weightLifted: Float
    @Binding var sets: Int
    @Binding var reps: Int
    @Binding var category: String
    @Binding var info: String
    @Query private var categories: [Category]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Exercise Name:")
                        .modifier(TextInputTitle())
                    TextField("e.g. Bench Press", text: $exerciseName)
                        .modifier(TextInputField())
                }
                .frame(maxWidth: .infinity)
                .frame(width: UIScreen.main.bounds.width * 0.60)
                Spacer(minLength: 20)
                
                VStack(alignment: .leading) {
                    Text("Weight:")
                        .modifier(TextInputTitle())
                    TextField("0", value: $weightLifted, format: .number)
                        .modifier(TextInputField())
                        .keyboardType(.numbersAndPunctuation)
                }
            }
            .padding(.bottom, 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Sets:")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $sets) {
                        ForEach(1..<7, content: { index in
                            Text("\(index)").tag(index)
                        })
                    }
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Reps:")
                        .modifier(TextInputTitle())
                    Picker("Reps:", selection: $reps) {
                        ForEach(1..<19, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    }
                    .pickerStyle(.menu)
                    .modifier(TextInputField())
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text("Category:")
                        .modifier(TextInputTitle())
                    Picker("Category:", selection: $category) {
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
            
            VStack(alignment: .leading) {
                Text("Info:")
                    .modifier(TextInputTitle())
                TextField("e.g. Drop set", text: $info, axis: .vertical)
                    .lineLimit(1)
                    .modifier(TextInputField())
            }
            .padding(.bottom, 25)
        }
        .navigationTitle("Exercise")
    }
}

//#Preview {
//    ExerciseForm()
//}
