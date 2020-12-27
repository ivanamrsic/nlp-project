//
//  FilterTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

class FilterTableViewCell: UITableViewCell {

    // MARK: IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var checkboxButton: UIButton!

    // MARK: - Private properties

    private var isSelectedButton = false

    private var disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

// MARK: - Configuration

extension FilterTableViewCell {

    func configure(with item: FilterCellItem) {
        setupUI(with: item)
        handle(selected: item.selected, item: item)
        isSelectedButton = item.selectedValue
    }
}

// MARK: - UI Setup

private extension FilterTableViewCell {

    func setupUI(with item: FilterCellItem) {
        titleLabel.text = item.title
    }
}

// MARK: - Binding Setup

private extension FilterTableViewCell {

    func handle(selected: Driver<Bool>, item: FilterCellItem) {

        checkboxButton.rx.tap
            .asDriver()
            .drive(onNext: { item.didSelectItem() })
            .disposed(by: disposeBag)

        selected
            .drive(onNext: { [unowned self] isSelected in
                let name = isSelected ? "checkmark.square" : "square"
                self.isSelectedButton = isSelected
                self.checkboxButton.setImage(UIImage(systemName: name), for: .normal)
            })
            .disposed(by: disposeBag)
    }
}
