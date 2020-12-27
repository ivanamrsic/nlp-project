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

    // MARK: - Private properties

    let didDelete: (() -> Void)?

    // MARK: - Init

    init(review: Review, didDelete: (() -> Void)? = nil) {
        self.review = review
        self.didDelete = didDelete
    }
}

// MARK: - TableCellItem

extension ReviewTableCellItem: TableCellItem {

    var canDelete: Bool {
        return didDelete != nil
    }

    func didDelete(at indexPath: IndexPath) {
        didDelete?()
    }

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ReviewTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }
}
