//
//  Set.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import Foundation

struct Set: Identifiable, Codable, Hashable {
    var id = UUID()
    var reps: Int
    var weight: Double
}
