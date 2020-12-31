//
//  FilterCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

struct FilterCellItem {

    // MARK: - Public properties

    let classifierScore: String

    // MARK: - Private properties

    private let isSelected: BehaviorRelay<Bool>

    // MARK: - Init

    init(classifierScore: String, isSelected: Bool) {
        self.classifierScore = classifierScore
        self.isSelected = BehaviorRelay<Bool>(value: isSelected)
    }
}

// MARK: - Computed properties

extension FilterCellItem {

    var title: String {
        return classifierScore.description
    }

    var selected: Driver<Bool> {
        return isSelected.asDriver()
    }

    var selectedValue: Bool {
        return isSelected.value
    }

    func didSelectItem() {
        isSelected.accept(!isSelected.value)
    }
}

// MARK: - TableCellItem

extension FilterCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: FilterTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelectItem()
    }
}
