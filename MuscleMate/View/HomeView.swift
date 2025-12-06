//
//  HomeView.swift
//  TICProject
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var repo = WorkoutRepository.shared
    @State private var selectedDate: Date = Date.today()
    @State private var showAddWorkout = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // MARK: - Calendário horizontal
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<7) { offset in
                            if let startOfWeek = Date.today().startOfWeek {
                                let day = startOfWeek.addingDays(offset)
                                
                                VStack(spacing: 8) {
                                    Text(day.dayName())
                                        .font(.designSystem(.caption))
                                        .foregroundColor(day.isSameDay(as: selectedDate) ? .primary : .secondary)
                                    
                                    Text("\(day.dayOfMonth)")
                                        .font(.designSystem(.button))
                                        .foregroundColor(day.isSameDay(as: selectedDate) ? .white : .primary)
                                        .frame(width: 40, height: 40)
                                        .background(day.isSameDay(as: selectedDate) ? Color.designSystem(.main(.primary)) : Color.gray.opacity(0.2))
                                        .clipShape(Circle())
                                }
                                .onTapGesture {
                                    withAnimation { selectedDate = day }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                
                Divider()
                
                // MARK: - Treinos do dia
                let filtered = repo.workouts.enumerated().filter { $0.element.date.isSameDay(as: selectedDate) }
                
                if filtered.isEmpty {
                    Spacer()
                    Text("Nenhum treino para este dia")
                        .foregroundStyle(.designSystem(color: .main(.text)))
                    Spacer()
                } else {
                    List {
                        ForEach(filtered, id: \.element.id) { index, workout in
                            NavigationLink(destination: WorkoutDetailView(workout: binding(for: workout))) {
                                HStack {
                                    Text(workout.title)
                                        .font(.designSystem(.cell))
                                    Spacer()
                                    Text("\(workout.exercises.count) exercício(s)")
                                        .foregroundStyle(.designSystem(color: .main(.text)))
                                        .font(.designSystem(.cell))
                                }
                                .padding(.vertical, 6)
                            }
                        }
                        .onDelete { offsets in
                            for offset in offsets {
                                let workoutIndex = filtered[offset].0
                                repo.workouts.remove(at: workoutIndex)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Treinos")
            .scrollContentBackground(.hidden)
            .background(Color(.designSystem(color: .background(.primary))))
            
            .toolbar {
                Button { showAddWorkout.toggle() } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddWorkout) {
                AddWorkoutView(repo: repo, isPresented: $showAddWorkout, selectedDate: selectedDate)
            }
        }
    }
    
    private func binding(for workout: Workout) -> Binding<Workout> {
        guard let index = repo.workouts.firstIndex(where: { $0.id == workout.id }) else {
            fatalError("Workout não encontrado")
        }
        return $repo.workouts[index]
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

