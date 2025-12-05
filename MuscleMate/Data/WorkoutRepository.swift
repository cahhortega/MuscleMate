//
//  WorkoutRepository.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
final class WorkoutRepository: ObservableObject {
    static let shared = WorkoutRepository()
    
    @Published var workouts: [Workout] = [] {
        didSet { WorkoutManager.shared.save(workouts) }
    }
    
    private init() {
        workouts = WorkoutManager.shared.load()
    }
    
    // MARK: - Mutations
    func addWorkout(title: String, date: Date) {
        let newWorkout = Workout(date: date, title: title)
        workouts.insert(newWorkout, at: 0)
    }
    
    func deleteWorkout(at index: IndexSet) {
        workouts.remove(atOffsets: index)
    }
}
