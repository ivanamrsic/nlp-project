//
//  TitleTableSection.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 28.12.2020..
//

import UIKit

/// Represents blank section - without header or footer
/// Used in conjuction with table view data source delegate
/// for easy mapping items to single section without footer
/// or header - just like you didn't use section at all.
public class TitleTableSection: TableSectionItem {

    public var items: [TableCellItem]
    public var title: String?

    public init(items: [TableCellItem], title: String) {
        self.items = items
        self.title = title
    }

    public convenience init?(items: [TableCellItem]?) {
        guard let items = items else {
            return nil
        }
        self.init(items: items)
    }

    public var headerHeight: CGFloat {
        return 50
    }

    public var footerHeight: CGFloat {
        return .leastNonzeroMagnitude
    }

    public var estimatedHeaderHeight: CGFloat {
        return headerHeight
    }

    public var estimatedFooterHeight: CGFloat {
        return footerHeight
    }

    public func titleForHeader(from tableView: UITableView, at index: Int) -> String? {
        return title
    }
}
