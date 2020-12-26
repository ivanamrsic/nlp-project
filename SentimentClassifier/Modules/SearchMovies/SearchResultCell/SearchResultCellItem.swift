//
//  SearchResultCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct SearchResultCellItem {

    // MARK: - Public properties

    let movie: SearchResponse.Movie

    // MARK: - Private properties

    private let didSelect: (() -> Void)?

    // MARK: - Init

    init(
        movie: SearchResponse.Movie, didSelect: (() -> Void)? = nil) {
        self.movie = movie
        self.didSelect = didSelect
    }
}

// MARK: - TableCellItem

extension SearchResultCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: SearchResultTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelect?()
    }
}
