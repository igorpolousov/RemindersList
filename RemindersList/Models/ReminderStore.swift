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
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        
        switch status {
        case .denied:
            throw AppErrors.accessDenied
            
        case .fullAccess:
            return
            
        case .notDetermined:
            let accessGranted = try await ekStore.requestFullAccessToReminders()
            guard accessGranted else {
                throw AppErrors.accessDenied
            }
            
        case .restricted:
            throw AppErrors.accessRestricted
            
        case .writeOnly:
            throw AppErrors.accessRestricted
            
        default:
            throw AppErrors.unknown
        }
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
