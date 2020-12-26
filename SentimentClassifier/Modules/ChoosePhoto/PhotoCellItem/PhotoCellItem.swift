//
//  PhotoCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct PhotoCellItem {

    // MARK: - Public properties

    let photo: ProfilePhoto
    let didSelect: ((ProfilePhoto) -> Void)?

    // MARK: - Init

    init(photo: ProfilePhoto, didSelect: ((ProfilePhoto) -> Void)? = nil) {
        self.photo = photo
        self.didSelect = didSelect
    }
}

// MARK: - TableCellITem

extension PhotoCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: PhotoTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelect?(photo)
    }
}
