//
//  Date+Extensions.swift
//  TICProject
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation

extension Date {
    // MARK: - Comparações
    func isSameDay(as other: Date, using calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }
    
    // MARK: - Componentes
    var dayOfMonth: Int {
        Calendar.current.component(.day, from: self)
    }
    
    func dayName(using formatter: DateFormatter = DateFormatter()) -> String {
        formatter.dateFormat = "EEE"
        return formatter.string(from: self).capitalized
    }
    
    // MARK: - Manipulação de semanas
    var startOfWeek: Date? {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
    }
    
    // MARK: Adição de tempo
    func addingDays(_ days: Int, using calendar: Calendar = .current) -> Date {
        calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    // MARK: - Utilitário
    static func today() -> Date { Date() }
}
