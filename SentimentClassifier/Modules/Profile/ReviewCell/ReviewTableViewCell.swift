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
        setupUI(with: item.review)
    }
}

// MARK: - UI Setup

private extension ReviewTableViewCell {

    func setupUI(with review: Review) {
        let movieTitle = review.movieTitle ?? ""
        let movieYear = review.movieYear != nil ? "(" + review.movieYear!  + ")" : ""
        movieTitleLabel.text = "\(movieTitle) \(movieYear)"
        titleLabel.text = review.reviewTitle
        dateLabel.text = review.reviewDate
        reviewTextLabel.text = review.reviewText
        sentimentResultLabel.text = review.sentiment
    }
}
