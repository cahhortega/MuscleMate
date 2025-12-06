//
//  AddSetModalView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

struct AddSetView: View {
    @Binding var exercise: Exercise
    @Binding var isPresented: Bool
    
    @State private var reps: Int = 10
    @State private var weight: Double = 20
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Stepper("Reps: \(reps)", value: $reps, in: 1...1000)
                    Stepper("Peso: \(Int(weight))kg", value: $weight, in: 0...1000)
                }
                .font(.designSystem(.section))
            }
            .navigationTitle("Novo Set")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Adicionar") {
                        exercise.sets.append(Set(reps: reps, weight: weight))
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
        .scrollContentBackground(.hidden)
        .background(.designSystem(color: .background(.secondary)))
    }
}
