//
//  LanguageSelectionCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

struct LanguageSelectionCellItem {

    // MARK: - Public properties

    let language: Language
    let options: [Language]

    // MARK: - Private properties

    private let didSet: ((Language) -> Void)?
    private let selected = BehaviorRelay<Void>(value: ())

    // MARK: - Init

    init(language: Language, options: [Language], didSet: ((Language) -> Void)? = nil) {
        self.language = language
        self.options = options
        self.didSet = didSet
    }
}

extension LanguageSelectionCellItem {

    var selectedDriver: Driver<Void> {
        return selected.asDriver()
    }

    func set(language: Language?) {
        guard let language = language else { return }
        didSet?(language)
    }
}

extension LanguageSelectionCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: LanguageSelectionTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        selected.accept(())
    }

}
