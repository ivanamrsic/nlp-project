//
//  ClassifierDescriptionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

class ClassifierDescriptionTableViewCell: UITableViewCell {

    @IBOutlet private weak var classifierNameLabel: UILabel!
    @IBOutlet private weak var radioButton: UIButton!

    private var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

// MARK: - Configuration

extension ClassifierDescriptionTableViewCell {

    func configure(with item: ClassifierDescriptionCellItem) {
        classifierNameLabel.text = item.title
        handleButtonTap(with: item)
    }
}

// MARK: - Binding setup

extension ClassifierDescriptionTableViewCell {

    func handleButtonTap(with item: ClassifierDescriptionCellItem) {
        radioButton.rx.tap
            .asDriver()
            .drive(onNext: { item.didSelectClassifier() })
            .disposed(by: disposeBag)

        item.isSelectedClassifier
            .drive(onNext: { [unowned radioButton] selected in
                let imageName = selected ? "record.circle" : "circle"
                radioButton?.setImage(
                    UIImage(systemName: imageName),
                    for: .normal
                )
            })
            .disposed(by: disposeBag)
    }
}
