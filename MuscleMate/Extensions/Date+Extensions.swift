//
//  Date+Extensions.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import Foundation

extension Date {
    func isSameDay(as other: Date, using calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }
    
    var dayOfMonth: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var startOfWeek: Date? {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
    }
    
    func dayName(using formatter: DateFormatter = DateFormatter()) -> String {
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
    
    func addingDays(_ days: Int, using calendar: Calendar = .current) -> Date {
        calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    static func today() -> Date { Date() }
}
