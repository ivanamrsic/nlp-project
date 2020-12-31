//
//  ClassifierDescriptionCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit

struct ClassifierDescriptionCellItem {

    let title: String
    let didSelectDetails: (() -> Void)

    init(title: String, didSelectDetails: @escaping (() -> Void)) {
        self.title = title
        self.didSelectDetails = didSelectDetails
    }
}

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
