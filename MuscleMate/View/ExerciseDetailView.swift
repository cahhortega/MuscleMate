//
//  ExerciseDetailView.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct ExerciseDetailView: View {
    @Binding var exercise: Exercise
    @State private var reps: Int = 10
    @State private var weight: Double = 20
    
    var body: some View {
        VStack {
            List {
                ForEach(exercise.sets) { set in
                    Text("Reps: \(set.reps), Peso: \(Int(set.weight))kg")
                }
                .onDelete { offsets in
                    exercise.sets.remove(atOffsets: offsets)
                }
            }
            
            HStack(spacing: 16) {
                Stepper("Repetições: \(reps)", value: $reps, in: 1...50)
                Divider()
                Stepper("Peso: \(Int(weight))kg", value: $weight, in: 0...200)
            }
            .padding()
            
            Button {
                exercise.sets.append(Set(reps: reps, weight: weight))
            } label: {
                Label("Adicionar set", systemImage: "plus.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
