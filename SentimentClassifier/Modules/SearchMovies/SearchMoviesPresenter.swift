//
//  SearchMoviesPresenter.swift
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

final class SearchMoviesPresenter {

    // MARK: - Private properties -

    private unowned let view: SearchMoviesViewInterface
    private let interactor: SearchMoviesInteractorInterface
    private let wireframe: SearchMoviesWireframeInterface

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    init(view: SearchMoviesViewInterface, interactor: SearchMoviesInteractorInterface, wireframe: SearchMoviesWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SearchMoviesPresenter: SearchMoviesPresenterInterface {

    func configure(with output: SearchMovies.ViewOutput) -> SearchMovies.ViewInput {
        handle(inputText: output.inputText)
        return SearchMovies.ViewInput()
    }

}

private extension SearchMoviesPresenter {

    func handle(inputText: Driver<String?>) {

        inputText.compactMap { $0 }
            .filter { $0.count > 0 }
            .distinctUntilChanged()
            .debounce(.milliseconds(500))
            .flatMap { [unowned interactor] in interactor.search(input: $0).asDriver(onErrorDriveWith: .empty()) }
            .drive(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
}
