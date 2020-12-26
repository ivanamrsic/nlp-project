//
//  ReviewTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var movieTitleLabel: UILabel!

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    @IBOutlet private weak var reviewTextLabel: UILabel!

    @IBOutlet private weak var sentimentResultLabel: UILabel!
}

extension ReviewTableViewCell {

    func configure(with item: ReviewTableCellItem) {
        setupUI(with: item)
    }
}

private extension ReviewTableViewCell {

    func setupUI(with item: ReviewTableCellItem) {
        movieTitleLabel.text = item.review.movie
        titleLabel.text = item.review.title
        dateLabel.text = item.review.date
        reviewTextLabel.text = item.review.text
        sentimentResultLabel.text = item.reviewScore
    }
}
