//
//  ReviewTableCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct ReviewTableCellItem {

    // MARK: - Public properties

    let review: Review

    // MARK: - Init

    init(review: Review) {
        self.review = review
    }
}

// MARK: - TableCellItem

extension ReviewTableCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ReviewTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }
}
