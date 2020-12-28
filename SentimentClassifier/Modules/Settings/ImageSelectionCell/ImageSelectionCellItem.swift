//
//  ImageSelectionCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit

struct ImageSelectionCellItem {

}

extension ImageSelectionCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ImageSelectionTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    var estimatedHeight: CGFloat {
        return 150
    }

    var height: CGFloat {
        return 150
    }
}
