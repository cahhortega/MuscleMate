//
//  Workout.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import Foundation

struct Workout: Identifiable, Codable, Hashable {
    var id = UUID()
    var date: Date = Date()
    var title: String
    var exercises: [Exercise] = []
}
