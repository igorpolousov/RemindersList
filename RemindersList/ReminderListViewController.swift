//
//  ViewController.swift
//  RemindersList
//
//  Created by Igor Polousov on 03.03.2025.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        // Создаёт секцию list layout
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

