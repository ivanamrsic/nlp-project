//
//  GeneralCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit

struct GeneralCellItem {

    let title: String?
    let didSelect: (() -> Void)

    init(title: String, didSelect: @escaping (() -> Void)) {
        self.title = title
        self.didSelect = didSelect
    }

}

// MARK: - TableCellItem

extension GeneralCellItem: TableCellItem {

    var estimatedHeight: CGFloat {
        return height
    }

    var height: CGFloat {
        return 60
    }

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: GeneralTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelect()
    }
}
