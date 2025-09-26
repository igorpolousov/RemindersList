//
//  AppErrors.swift
//  RemindersList
//
//  Created by Igor Polousov on 25.09.2025.
//

import UIKit

enum AppErrors: LocalizedError {
    
    case accessDenied
    case failedReadingreminders
    case reminderHasNoDueDate
    case accessRestricted
    case unknown
    case failedReadingCalendarItem
    
    var errorDescription: String? {
        switch self {
        case .failedReadingreminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed reading reminders error description")
            
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "reminder has no due date error description")
            
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permossion to read reminders", comment: "Access denied error description")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders", comment: "Access restricted error description")
        case .unknown:
            return NSLocalizedString("An unknown error occured", comment: "unknown error description")
        case .failedReadingCalendarItem:
            return NSLocalizedString("Failed to read a calendar item", comment: "Failed to read calendar item error description")
        }
 
    }
}
