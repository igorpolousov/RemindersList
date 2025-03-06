//
//  ViewController.swift
//  RemindersList
//
//  Created by Igor Polousov on 03.03.2025.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell , indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        // простой вариант добавить массив с reminder titles
//        var reminderTitles: [String] = []
//        for reminder in Reminder.sampleData {
//            reminderTitles.append(reminder.title)
//        }
//        snapshot.appendItems(reminderTitles)
        
        // Вариант с применением функционального кода
        snapshot.appendItems(Reminder.sampleData.map {$0.title})
        dataSource?.apply(snapshot)
        
        collectionView.dataSource = dataSource
        
        
        
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        // Создаёт секцию list layout
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

