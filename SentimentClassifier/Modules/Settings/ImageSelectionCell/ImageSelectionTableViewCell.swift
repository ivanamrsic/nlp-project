//
//  ImageSelectionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

class ImageSelectionTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

// MARK: - Configuration

extension ImageSelectionTableViewCell {

    func configure(with item: ImageSelectionCellItem) {
        item.photoViews.forEach { [unowned stackView] in
            stackView?.addArrangedSubview($0)
        }
    }
}
