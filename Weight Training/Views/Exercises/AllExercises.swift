//
//  AllExercises.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI
import SwiftData

struct AllExercises: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
                if !exercises.isEmpty {
                    List {
                        ForEach(filteredCategories(), id: \.self) { category in
                            Section(header: Text(category).modifier(CategoryTag())) {
                                ForEach(filteredExercises(for: category), id: \.id) { exercise in
                                    NavigationLink(
                                        destination: EditExercise(exercise: exercise)
                                    ) {
                                        ExerciseListItem(exercise: exercise)
                                            .swipeActions {
                                                Button("Delete") {
                                                    deleteExercise(exercise: exercise, context: context)
                                                }
                                                .tint(.red)
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("All Exercises")
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination:
                            CreateExercise()
                    ) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, design: .rounded))
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
    }

    var categories: [String] {
        Array(Set(exercises.map { $0.category }).sorted())
    }

    func filteredExercises(for category: String) -> [Exercise] {
        if searchText.isEmpty {
            return exercises.filter { $0.category == category }
        } else {
            return exercises.filter { exercise in
                return exercise.exerciseName.localizedCaseInsensitiveContains(searchText) && exercise.category == category
            }
        }
    }

    func filteredCategories() -> [String] {
        return categories.filter { category in
            filteredExercises(for: category).count > 0
        }
    }
}


//#Preview {
//    AllExercises()
//}
