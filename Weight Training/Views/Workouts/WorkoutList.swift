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
    @State private var selectedMonth: String = "This Week" // Default to "This Week"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if !workouts.isEmpty {
                    Picker("Filter by Time", selection: $selectedMonth) {
                        Text("This Week").tag("This Week") // New filter "This Week"
                        Text("All").tag("All")
                        ForEach(uniqueMonths().sorted(), id: \.self) { month in
                            Text(month).tag("\(month)")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 100, height: 100)).fill(.blue.opacity(0.2)))
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 00, trailing: 0))
                    List {
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
            .navigationTitle("Workouts")
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: CreateWorkout()
                    ) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, design: .rounded))
                            .foregroundStyle(.blue)
                    }
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
        
        if selectedMonth == "This Week" {
            let calendar = Calendar.current
            let now = Date()
            let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))
            let endOfWeek = calendar.date(byAdding: .day, value: 7, to: startOfWeek!)
            
            return workouts.filter { workout in
                return workout.date >= startOfWeek! && workout.date <= endOfWeek!
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
