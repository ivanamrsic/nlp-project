//
//  UITableViewExtensions.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

public extension UITableView {

    /// Returns a reusable table-view cell object for the specified reuse identifier and type
    /// and adds it to the table.
    ///
    /// If identifier is not provided, cell type will be used as idenitifer.
    ///
    /// - Parameters:
    ///   - type: The class of a cell that you want to use in the table (must be a UITableViewCell subclass).
    ///   - identifier: Custom cell identifier
    ///   - indexPath: The index path specifying the location of the cell
    /// - Returns: A subclass of UITableViewCell object with the associated reuse identifier.
    func dequeueReusableCell<T: UITableViewCell>(
        ofType type: T.Type,
        withReuseIdentifier identifier: String? = nil,
        for indexPath: IndexPath
    ) -> T {
        let identifier = identifier ?? String(describing: type)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }

    /// Returns a reusable header or footer view located by its identifier with concrete type.
    ///
    /// - Parameters:
    ///   - type: The class of a view that you want to use in the table (must be a UITableViewHeaderFooterView subclass).
    ///   - identifier: Custom header or footer view identifier
    /// - Returns: A subclass of UITableViewHeaderFooterView object with the associated reuse identifier.
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(
        ofType type: T.Type,
        withReuseIdentifier identifier: String? = nil
    ) -> T {
        let identifier = identifier ?? String(describing: type)
        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }


    // MARK: - Register cell

    /// Registers a nib object containing a cell, from specified bundle,
    /// with the table view under a specified identifier. Cell nib object and
    /// cell class name have to be the same.
    ///
    /// If identifier is not provided, cell type will be used as idenitifer.
    ///
    /// If bundle is not provided, main bundle will be used.
    ///
    /// - Parameters:
    ///   - cellType: The class of a cell that you want to use in the table (must be a UITableViewCell subclass).
    ///   - identifier: Cell reuse identifier
    ///   - bundle: Nib object source bundle
    func registerNib<T: UITableViewCell>(
        cellOfType cellType: T.Type,
        withReuseIdentifier identifier: String? = nil,
        in bundle: Bundle? = nil
    ) {
        let cellName = String(describing: cellType)
        let identifier = identifier ?? cellName
        let source = bundle ?? Bundle(for: cellType)
        let nib = UINib(nibName: cellName, bundle: source)
        register(nib, forCellReuseIdentifier: identifier)
    }

    /// Registers a class for use in creating new table cells.
    ///
    /// If identifier is not provided, cell type will be used as idenitifer.
    ///
    /// - Parameters:
    ///   - cellType: The class of a cell that you want to use in the table (must be a UITableViewCell subclass).
    ///   - identifier: Cell reuse identifier
    func registerClass<T: UITableViewCell>(
        cellOfType cellType: T.Type,
        withReuseIdentifier identifier: String? = nil
    ) {
        let cellName = String(describing: cellType)
        let identifier = identifier ?? cellName
        register(cellType, forCellReuseIdentifier: identifier)
    }

    // MARK: - Register header footer view

    /// Registers a nib object containing a header or footer, from specified bundle,
    /// with the table view under a specified identifier. View nib object and view
    /// class name have to be the same.
    ///
    /// If identifier is not provided, view type will be used as idenitifer.
    ///
    /// If bundle is not provided, main bundle will be used.
    ///
    /// - Parameters:
    ///   - viewType: The class of a header or footer view that you want to use in the table (must be a `UITableViewHeaderFooterView` subclass).
    ///   - identifier: The reuse identifier for the header or footer view.
    ///   - bundle: Nib object source bundle
    func registerNib<T: UITableViewHeaderFooterView>(
        viewOfType viewType: T.Type,
        withHeaderFooterViewReuseIdentifier identifier: String? = nil,
        in bundle: Bundle? = nil
    ) {
        let viewName = String(describing: viewType)
        let identifier = identifier ?? viewName
        let source = bundle ?? Bundle(for: viewType)
        let nib = UINib(nibName: viewName, bundle: source)
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }

    /// Registers a class for use in creating new table header or footer views.
    ///
    /// If identifier is not provided, view type will be used as idenitifer.
    ///
    /// - Parameters:
    ///   - viewType: The class of a header or footer view that you want to use in the table (must be a `UITableViewHeaderFooterView` subclass).
    ///   - identifier: The reuse identifier for the header or footer view.
    func registerClass<T: UITableViewHeaderFooterView>(
        viewOfType viewType: T.Type,
        withHeaderFooterViewReuseIdentifier identifier: String? = nil
    ) {
        let viewName = String(describing: viewType)
        let identifier = identifier ?? viewName
        register(viewType, forHeaderFooterViewReuseIdentifier: identifier)
    }
}
