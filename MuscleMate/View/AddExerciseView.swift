//
//  AddExerciseView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI
import SwiftUI

struct AddExerciseView: View {
    @Binding var exercises: [Exercise]
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var sets: [Set] = []
    
    // Modal para adicionar set
    @State private var showAddSetSheet: Bool = false
    @State private var tempExercise: Exercise = Exercise(name: "", sets: [])
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nome do exercício")) {
                    TextField("Ex: Supino", text: $name)
                }
                
                Section(header: Text("Sets")) {
                    // Lista de sets atuais
                    ForEach(sets) { set in
                        Text("Reps: \(set.reps), Peso: \(Int(set.weight))kg")
                    }
                    .onDelete { offsets in
                        sets.remove(atOffsets: offsets)
                    }
                    
                    // Botão para adicionar novo set
                    Button {
                        // Prepara o tempExercise com os sets atuais
                        tempExercise = Exercise(name: name.isEmpty ? "Novo exercício" : name, sets: sets)
                        showAddSetSheet = true
                    } label: {
                        Label("Adicionar set", systemImage: "plus.circle.fill")
                    }
                    .sheet(isPresented: $showAddSetSheet) {
                        AddSetModalView(exercise: $tempExercise, isPresented: $showAddSetSheet)
                            .presentationDetents([.medium])
                            .onDisappear {
                                sets = tempExercise.sets
                            }
                    }
                }
            }
            .navigationTitle("Novo Exercício")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let finalName = name.isEmpty ? "Novo exercício" : name
                        let newExercise = Exercise(name: finalName, sets: sets)
                        exercises.append(newExercise)
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

