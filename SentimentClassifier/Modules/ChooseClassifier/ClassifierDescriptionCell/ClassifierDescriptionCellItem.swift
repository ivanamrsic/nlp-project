//
//  ClassifierDescriptionCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

struct ClassifierDescriptionCellItem {

    // MARK: - Public Properties

    let title: String
    let isSelectedClassifier: Driver<Bool>
    let didSelectDetails: (() -> Void)
    let didSelectClassifier: (() -> Void)

    // MARK: - Init

    init(
        title: String,
        isSelectedClassifier: Driver<Bool>,
        didSelectClassifier: @escaping (() -> Void),
        didSelectDetails: @escaping (() -> Void)
    ) {
        self.title = title
        self.isSelectedClassifier = isSelectedClassifier
        self.didSelectClassifier = didSelectClassifier
        self.didSelectDetails = didSelectDetails
     }
}

// MARK: - TableCellItem

extension ClassifierDescriptionCellItem: TableCellItem {

    var estimatedHeight: CGFloat {
        return height
    }

    var height: CGFloat {
        return 80
    }

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ClassifierDescriptionTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelectDetails()
    }
}
