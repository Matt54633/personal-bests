//
//  WorkoutList.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import SwiftUI
import SwiftData

struct WorkoutList: View {
    @Environment(\.modelContext) private var context
    @Query private var workouts: [Workout]
    @State private var selectedMonth: String = "This Week"
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if !workouts.isEmpty {
                    List {
                        Section(header: Picker("Filter by Time", selection: $selectedMonth) {
                            Text("This Week").tag("This Week")
                            Text("All Time").tag("All")
                            ForEach(uniqueMonths().sorted(), id: \.self) { month in
                                Text(month).tag("\(month)")
                            }
                        }
                            .padding(-6.5)
                            .padding(.horizontal, -7.5)
                            .modifier(CategoryTag())
                            .pickerStyle(.menu)
                        )
                        {
                            ForEach(filteredWorkouts().sorted(by: { $0.date > $1.date }), id: \.id) { workout in
                                NavigationLink(
                                    destination: EditWorkout(workout: workout)
                                ) {
                                    WorkoutListItem(workout: workout)
                                        .swipeActions {
                                            Button("Delete") {
                                                deleteWorkout(workout: workout, context: context)
                                            }
                                            .tint(.red)
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
            .navigationTitle("Workouts")
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: CreateWorkout()
                    ) {
                        Image(systemName: "plus")
                    }
                    .modifier(BlueButtonStyle())
                }
            }
        }
    }
    
    private func uniqueMonths() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return Array(Set(workouts.map { dateFormatter.string(from: $0.date) }))
    }
    
    private func filteredWorkouts() -> [Workout] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        let calendar = Calendar.current
        let now = Date()
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))
        let endOfWeek = calendar.date(byAdding: .day, value: 7, to: startOfWeek!)
        
        if selectedMonth == "This Week" && !searchText.isEmpty {
            return workouts.filter { workout in
                _ = dateFormatter.string(from: workout.date)
                return workout.category.localizedCaseInsensitiveContains(searchText) &&
                workout.date >= startOfWeek! && workout.date <= endOfWeek!
            }
        } else if selectedMonth == "This Week" {
            return workouts.filter { workout in
                return workout.date >= startOfWeek! && workout.date <= endOfWeek!
            }
        } else if !searchText.isEmpty {
            return workouts.filter { workout in
                let workoutMonth = dateFormatter.string(from: workout.date)
                return workout.category.localizedCaseInsensitiveContains(searchText) &&
                (selectedMonth == "All" || workoutMonth == selectedMonth)
            }
        } else {
            return workouts.filter { workout in
                let workoutMonth = dateFormatter.string(from: workout.date)
                return selectedMonth == "All" || workoutMonth == selectedMonth
            }
        }
    }
}

#Preview {
    WorkoutList()
}
