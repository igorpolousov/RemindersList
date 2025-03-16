//
//  ReminderListViewController+Actions.swift
//  RemindersList
//
//  Created by Igor Polousov on 15.03.2025.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
