//
//  ReminderStore.swift
//  RemindersList
//
//  Created by Igor Polousov on 26.09.2025.
//

import Foundation
import EventKit

final class ReminderStore {
     
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .fullAccess
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw AppErrors.accessDenied
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.reminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch AppErrors.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
}
