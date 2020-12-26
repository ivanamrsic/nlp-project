//
//  ReviewTableCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct ReviewTableCellItem {

    let review: Review

    init(review: Review) {
        self.review = review
    }

}

extension ReviewTableCellItem: TableCellItem {

    var reviewScore: String {
        return ClassifierModel().classify(text: review.text).description
    }

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ReviewTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }
}
