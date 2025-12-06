//
//  AddWorkoutIntent.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import Foundation
import SwiftUI
import AppIntents

@available(iOS 17.0, *)
struct AddWorkoutIntent: AppIntent {
    static var title: LocalizedStringResource = "Adicionar treino"
    static var description = IntentDescription("Adiciona um novo treino à sua lista")
    
    @Parameter(title: "Nome do treino")
    var title: String
    
    @Parameter(title: "Data do Treino")
    var date: Date
    
    static var parameterSummary: some ParameterSummary {
        Summary("Adicionar treino \(\.$title) na data \(\.$date)") { }
    }
    
    static var outputType: String.Type = String.self
    
    func perform() async throws -> some ReturnsValue<String> {
        let store = await WorkoutRepository.shared
        
        await store.addWorkout(title: title, date: date)
        
        return .result(value: "Treino '\(title)' adicionado com sucesso para \(date.formatted(.dateTime.month().day().year()))!")
    }
}
