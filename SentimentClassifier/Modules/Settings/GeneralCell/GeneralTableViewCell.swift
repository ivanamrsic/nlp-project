//
//  GeneralTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit

final class GeneralTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Configuration

extension GeneralTableViewCell {

    func configure(with item: GeneralCellItem) {
        titleLabel.text = item.title
    }
}
