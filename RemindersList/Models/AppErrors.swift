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
    
    var errorDescription: String? {
        switch self {
        case .failedReadingreminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed reading reminders error description")
            
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "reminder has no due date error description")
            
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permossion to read reminders", comment: "Access denied error description")
        }
 
    }
}
