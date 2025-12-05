//
//  WorkoutManager.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation
final class WorkoutManager {
    static let shared = WorkoutManager()
    
    private init() {}
    
    private let filename = "workouts.json"
    private var fileURL: URL? {
        let fm = FileManager.default
        guard let docs = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docs.appendingPathComponent(filename)
    }
    
    func save(_ sessions: [Workout]) {
        guard let url = fileURL else { return }
        
        do {
            let data = try JSONEncoder().encode(sessions)
            try data.write(to: url, options: [.atomic])
        } catch {
            print("Save error:", error)
        }
    }
    
    func load() -> [Workout] {
        guard let url = fileURL, FileManager.default.fileExists(atPath: url.path) else { return [] }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Workout].self, from: data)
        } catch {
            print("Load error:", error)
            return []
        }
    }
}
