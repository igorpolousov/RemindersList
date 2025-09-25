//
//  EKEventStore+AsyncFetch.swift
//  RemindersList
//
//  Created by Igor Polousov on 25.09.2025.
//

import Foundation
import EventKit

extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: AppErrors.failedReadingreminders)
                }
            }
        }
    }
}
