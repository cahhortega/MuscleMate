//
//  WorkoutDetailView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

struct WorkoutDetailView: View {
    @Binding var workout: Workout
    
    @State private var selectedExercise: Exercise?
    @State private var showAddSetSheet: Bool = false
    @State private var showAddExerciseSheet: Bool = false
    @State private var expandedExerciseID: UUID? = nil
    
    var body: some View {
        List {
            ForEach($workout.exercises) { $exercise in
                DisclosureGroup(
                    isExpanded: Binding(
                        get: { expandedExerciseID == exercise.id },
                        set: { isExpanding in
                            expandedExerciseID = isExpanding ? exercise.id : nil
                        }
                    )
                ) {
                    ForEach($exercise.sets) { $set in
                        HStack(spacing: 16) {
                            Text("Reps: \(set.reps)")
                            Divider()
                            Text("Peso: \(Int(set.weight))kg")
                        }
                        .font(.designSystem(.cell))
                    }
                    .onDelete { offsets in
                        exercise.sets.remove(atOffsets: offsets)
                    }
                    
                    Button {
                        selectedExercise = exercise
                        showAddSetSheet = true
                    } label: {
                        Label("Adicionar set", systemImage: "plus.circle.fill")
                            .foregroundStyle(.designSystem(color: .main(.primary)))
                            .font(.designSystem(.button))
                    }
                } label: {
                    Text(exercise.name)
                        .font(.designSystem(.cell))
                }
            }
            .onDelete { offsets in
                workout.exercises.remove(atOffsets: offsets)
            }
            
            Button {
                showAddExerciseSheet = true
            } label: {
                Label("Adicionar exercício", systemImage: "plus.circle.fill")
            }
            .foregroundStyle(.designSystem(color: .main(.primary)))
            .font(.designSystem(.button))
            
        }
        .scrollContentBackground(.hidden)
        .background(Color(.designSystem(color: .background(.primary))).ignoresSafeArea())
        .navigationTitle(workout.title)
        
        .sheet(isPresented: $showAddSetSheet) {
            if let bindingExercise = bindingForSelectedExercise() {
                AddSetModalView(exercise: bindingExercise, isPresented: $showAddSetSheet)
                    .presentationDetents([.medium])
            }
        }
        .sheet(isPresented: $showAddExerciseSheet) {
            AddExerciseView(exercises: $workout.exercises, isPresented: $showAddExerciseSheet)
        }
    }
    
    
    private func bindingForSelectedExercise() -> Binding<Exercise>? {
        guard let exercise = selectedExercise,
              let index = workout.exercises.firstIndex(where: { $0.id == exercise.id })
        else { return nil }
        return $workout.exercises[index]
    }
}


