//
//  ReviewTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

final class ReviewTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var movieTitleLabel: UILabel!

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    @IBOutlet private weak var reviewTextLabel: UILabel!
    
    @IBOutlet private weak var sentimentResultLabel: UILabel!

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        movieTitleLabel.text = ""
        titleLabel.text = ""
        dateLabel.text = ""
        reviewTextLabel.text = ""
        sentimentResultLabel.text = ""
    }
}

// MARK: - Configuration

extension ReviewTableViewCell {

    func configure(with item: ReviewTableCellItem) {
        setupUI(with: item)
    }
}

// MARK: - UI Setup

private extension ReviewTableViewCell {

    func setupUI(with item: ReviewTableCellItem) {
        movieTitleLabel.text = item.review.movie
        titleLabel.text = item.review.title
        dateLabel.text = item.review.date
        reviewTextLabel.text = item.review.text
        sentimentResultLabel.text = item.review.reviewScore
    }
}
