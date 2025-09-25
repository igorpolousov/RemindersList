//
//  AppErrors.swift
//  RemindersList
//
//  Created by Igor Polousov on 25.09.2025.
//

import UIKit

enum AppErrors: LocalizedError {
    
    case failedReadingreminders
    
    var errorDescription: String? {
        switch self {
        case .failedReadingreminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed reading reminders error description")
        }
    }
}
