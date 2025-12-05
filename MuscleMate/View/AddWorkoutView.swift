//
//  AddWorkoutView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

struct AddWorkoutView: View {
    @ObservedObject var repo: WorkoutRepository
    @Binding var isPresented: Bool
    var selectedDate: Date
    
    @State private var name: String = ""
    @State private var exercises: [Exercise] = []
    @State private var showAddExerciseSheet = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Treino")) {
                    TextField("Nome do treino", text: $name)
                }
                
                Section(header: Text("Exercícios")) {
                    ForEach(exercises) { exercise in
                        Text(exercise.name)
                    }
                    .onDelete { offsets in
                        exercises.remove(atOffsets: offsets)
                    }
                    
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            showAddExerciseSheet = true
                        }
                    } label: {
                        Label("Adicionar Exercício", systemImage: "plus.circle.fill")
                    }
                    .sheet(isPresented: $showAddExerciseSheet) {
                        AddExerciseView(exercises: $exercises, isPresented: $showAddExerciseSheet)
                    }
                }
            }
            .navigationTitle("Novo Treino")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let finalName = name.isEmpty ? "Novo Treino" : name
                        let newWorkout = Workout(date: selectedDate, title: finalName, exercises: exercises)
                        repo.workouts.insert(newWorkout, at: 0)
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { isPresented = false }
                }
            }
        }
    }
}
