//
//  ClassifierDescriptionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

final class ClassifierDescriptionTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var classifierNameLabel: UILabel!
    @IBOutlet private weak var radioButton: UIButton!

    // MARK: - Private properties

    private var disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

// MARK: - Configuration

extension ClassifierDescriptionTableViewCell {

    func configure(with item: ClassifierDescriptionCellItem) {
        setupUI(with: item.title)
        handleButtonTap(with: item)
    }
}

// MARK: - Binding Setup

extension ClassifierDescriptionTableViewCell {

    func handleButtonTap(with item: ClassifierDescriptionCellItem) {
        radioButton.rx.tap
            .asDriver()
            .drive(onNext: { item.didSelectClassifier() })
            .disposed(by: disposeBag)

        item.isSelectedClassifier
            .drive(onNext: { [unowned self] in self.setUI(for: $0) })
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup

private extension ClassifierDescriptionTableViewCell {

    func setupUI(with title: String) {
        classifierNameLabel.text = title
    }

    func setUI(for selected: Bool) {
        let imageName = selected ? "record.circle" : "circle"
        radioButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
