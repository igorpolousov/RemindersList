//
//  ReminderListStyle.swift
//  RemindersList
//
//  Created by Igor Polousov on 25.09.2025.
//

import Foundation

enum ReminderListStyle: Int {
    
    case today
    case future
    case all
    
    func shouldInclude(date: Date)-> Bool {
        // прикольная штука
        let isInToday = Locale.current.calendar.isDateInToday(date)
        
        switch self {
            
        case .today:
            return isInToday
            
        case .future:
            return (date > Date.now) && !isInToday
            
        case .all:
            return true
        }
    }
}
