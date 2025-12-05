//
//  Exercise.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import Foundation

struct Exercise: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var sets: [Set] = []
}
