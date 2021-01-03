//
//  SearchMoviesViewController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa
import SkyFloatingLabelTextField

final class SearchMoviesViewController: NLPViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var inputTextField: SkyFloatingLabelTextField!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(cellOfType: SearchResultTableViewCell.self)
        }
    }

    @IBOutlet private weak var activtyIndicator: UIActivityIndicatorView!
    
    // MARK: - Public properties

    var presenter: SearchMoviesPresenterInterface!

    // MARK: - Private properties

    private lazy var dataSourceDelegate: TableDataSourceDelegate = {
        return TableDataSourceDelegate(tableView: self.tableView)
    }()

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputTextField.becomeFirstResponder()
    }
}

// MARK: - SearchMoviesViewInterface

extension SearchMoviesViewController: SearchMoviesViewInterface {

    func showLoading() {
        activtyIndicator.startAnimating()
    }

    func hideLoading() {
        activtyIndicator.stopAnimating()
    }
}

// MARK: - Configuration

private extension SearchMoviesViewController {

    func configure() {
        let output = SearchMovies.ViewOutput(
            inputText: inputTextField.rx.text.asDriver()
        )

        let input = presenter.configure(with: output)
        handle(items: input.items)
    }
}

// MARK: - UI setup

private extension SearchMoviesViewController {

    func setupUI() {
        inputTextField.placeholder = Strings.searchForAMovie
    }
}

// MARK: - Binding setup

private extension SearchMoviesViewController {

    func handle(items: Driver<[TableCellItem]>) {
        items.drive(dataSourceDelegate.rx.items)
            .disposed(by: disposeBag)
    }
}
