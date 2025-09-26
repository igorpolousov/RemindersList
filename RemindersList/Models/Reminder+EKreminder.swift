//
//  Reminder+EKreminder.swift
//  RemindersList
//
//  Created by Igor Polousov on 26.09.2025.
//

import Foundation
import EventKit

extension Reminder {
    
    init(with ekReimnder: EKReminder) throws {
        guard let dueDate = ekReimnder.alarms?.first?.absoluteDate else { throw AppErrors.reminderHasNoDueDate }
        
        id = ekReimnder.calendarItemIdentifier
        title = ekReimnder.title
        self.dueDate = dueDate
        notes = ekReimnder.notes
        isComplete = ekReimnder.isCompleted
    }
    
    
}


