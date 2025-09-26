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
}
