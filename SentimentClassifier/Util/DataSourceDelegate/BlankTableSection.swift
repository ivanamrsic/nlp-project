//
//  BlankTableSection.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

/// Represents blank section - without header or footer
/// Used in conjuction with table view data source delegate
/// for easy mapping items to single section without footer
/// or header - just like you didn't use section at all.
public class BlankTableSection: TableSectionItem {

    public var items: [TableCellItem]

    public init(items: [TableCellItem]) {
        self.items = items
    }

    public convenience init?(items: [TableCellItem]?) {
        guard let items = items else {
            return nil
        }
        self.init(items: items)
    }

    public var headerHeight: CGFloat {
        return .leastNonzeroMagnitude
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

}
