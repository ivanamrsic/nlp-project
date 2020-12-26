//
//  SearchResultTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
}

extension SearchResultTableViewCell {

    func configure(with item: SearchResultCellItem) {
        let url = URL(string: item.movie.poster)
        posterImageView.kf.setImage(with: url, placeholder: UIImage.moviePlaceholder)
        titleLabel.text = item.movie.title
        yearLabel.text = item.movie.year
        typeLabel.text = item.movie.type
    }
}
