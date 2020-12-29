//
//  PhotoTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Configuration

extension PhotoTableViewCell {

    func configure(with item: PhotoCellItem) {
        setupUI(with: item)
    }
}

// MARK: - UI Setup

private extension PhotoTableViewCell {

    func setupUI(with item: PhotoCellItem) {
        photoImageView.image = item.photo.image
        titleLabel.text = item.photo.name
    }
}
