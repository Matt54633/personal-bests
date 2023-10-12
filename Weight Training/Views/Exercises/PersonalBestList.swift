//
//  PersonalBestList.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI
import SwiftData

struct PersonalBestList: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Exercise.creationDate, order: .reverse) private var exercises: [Exercise]
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    ForEach(categoriesWithExercises(sorted: categories), id: \.self) { category in
                        Section(header: Text(category).modifier(CategoryTag())) {
                            ForEach(filteredExercises(category: category), id: \.id) { exercise in
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
                .searchable(text: $searchText) // Add the searchable modifier here
            }
            .navigationTitle("Personal Bests")
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
    }

    var categories: [String] {
        return Array(Set(exercises.map { $0.category })).sorted()
    }

    func categoriesWithExercises(sorted: [String]) -> [String] {
        return sorted.filter { category in
            return !filteredExercises(category: category).isEmpty
        }
    }

    func filteredExercises(category: String) -> [Exercise] {
        let maxWeightExercises = findMaxWeightExercises(category: category)

        return maxWeightExercises.filter { exercise in
            return searchText.isEmpty || exercise.exerciseName.localizedCaseInsensitiveContains(searchText)
        }
    }

    func findMaxWeightExercises(category: String) -> [Exercise] {
        var maxWeightExercises = [Exercise]()

        for exercise in exercises {
            if exercise.category == category {
                if let existingExercise = maxWeightExercises.first(where: { $0.exerciseName == exercise.exerciseName }) {
                    if exercise.weightLifted > existingExercise.weightLifted {
                        if let index = maxWeightExercises.firstIndex(where: { $0.id == existingExercise.id }) {
                            maxWeightExercises[index] = exercise
                        }
                    }
                } else {
                    maxWeightExercises.append(exercise)
                }
            }
        }

        return maxWeightExercises
    }
}

#Preview {
    PersonalBestList()
}
