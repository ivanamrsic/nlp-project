//
//  SearchResultTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit
import Kingfisher

final class SearchResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
}

// MARK: - Configuration

extension SearchResultTableViewCell {

    func configure(with item: SearchResultCellItem) {
        titleLabel.text = item.movie.title
        yearLabel.text = item.movie.year
        typeLabel.text = item.movie.type
        posterImageView.kf.setImage(
            with: URL(string: item.movie.poster),
            placeholder: UIImage.moviePlaceholder
        )
    }
}
