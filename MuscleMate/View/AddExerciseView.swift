//
//  AddExerciseView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

struct AddExerciseView: View {
    @Binding var exercises: [Exercise]
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var sets: [Set] = []
    @State private var showAddSetSheet: Bool = false
    @State private var tempExercise: Exercise = Exercise(name: "", sets: [])
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nome do exercício")) {
                    TextField("Ex: Supino", text: $name)
                        .font(.designSystem(.cell))

                }
                .font(.designSystem(.section))

                Section(header: Text("Sets")) {
                    ForEach(sets) { set in
                        HStack(spacing: 16) {
                            Text("Reps: \(set.reps)")
                            Divider()
                            Text("Peso: \(Int(set.weight))kg")
                        }
                        .font(.designSystem(.cell))
                    }
                    .onDelete { offsets in
                        sets.remove(atOffsets: offsets)
                    }
                    
                    Button {
                        tempExercise = Exercise(name: name.isEmpty ? "Novo exercício" : name, sets: sets)
                        showAddSetSheet = true
                    } label: {
                        Label("Adicionar set", systemImage: "plus.circle.fill")
                    }
                    .foregroundStyle(.designSystem(color: .main(.primary)))
                    .font(.designSystem(.button))

                    .sheet(isPresented: $showAddSetSheet) {
                        AddSetModalView(exercise: $tempExercise, isPresented: $showAddSetSheet)
                            .presentationDetents([.medium])
                            .onDisappear {
                                sets = tempExercise.sets
                            }
                    }
                }
                .font(.designSystem(.section))

            }
            .navigationTitle("Novo Exercício")
            .scrollContentBackground(.hidden)
            .background(.designSystem(color: .background(.secondary)))

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let finalName = name.isEmpty ? "Novo exercício" : name
                        let newExercise = Exercise(name: finalName, sets: sets)
                        exercises.append(newExercise)
                        isPresented = false
                    }
                    .font(.designSystem(.button))
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        isPresented = false
                    }
                    .font(.designSystem(.button))
                }
            }
        }
    }
}

