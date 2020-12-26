//
//  ReviewTableCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct ReviewTableCellItem {

    let review: Review
    let reviewScore: String

    init(review: Review, reviewScore: String) {
        self.review = review
        self.reviewScore = reviewScore
    }

}

extension ReviewTableCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ReviewTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }
}
