//
//  FilterReviewsPresenter.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class FilterReviewsPresenter {

    // MARK: - Private properties

    private unowned let view: FilterReviewsViewInterface
    private let interactor: FilterReviewsInteractorInterface
    private let wireframe: FilterReviewsWireframeInterface

    private let delegate: FilterDelegate

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init(view: FilterReviewsViewInterface, interactor: FilterReviewsInteractorInterface, wireframe: FilterReviewsWireframeInterface, delegate: FilterDelegate) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.delegate = delegate
    }
}

// MARK: - FilterReviewsPresenterInterface

extension FilterReviewsPresenter: FilterReviewsPresenterInterface {

    func configure(with output: FilterReviews.ViewOutput) -> FilterReviews.ViewInput {

        let items = createItems()

        handle(filterAction: output.filterAction, from: items)

        return FilterReviews.ViewInput(
            items: items.compactMap { $0.map { item in item as TableCellItem } }
        )
    }
}

// MARK: - Items creation

private extension FilterReviewsPresenter {

    func createItems() -> Driver<[FilterCellItem]> {

        let items: [FilterCellItem] = ClassifierManager.shared.allResults.map { score in
            let isSelected = delegate.currentFilters.contains(where: { score.description == $0.description })
            return FilterCellItem(classifierScore: score, isSelected: isSelected)
        }

        return .just(items)
    }
}

// MARK: - Binding setup

private extension FilterReviewsPresenter {

    func handle(filterAction: Signal<Void>, from items: Driver<[FilterCellItem]>)  {

        filterAction
            .asDriver(onErrorDriveWith: .empty())
            .flatMap { _ in items }
            .map { items in
                return items
                        .filter { $0.selectedValue }
                        .map { $0.classifierScore }
            }
            .do(onNext: { [unowned wireframe] _ in wireframe.dismiss() })
            .drive(onNext: { [unowned self] in
                self.delegate.process(sentimentFilters: $0)
            })
            .disposed(by: disposeBag)
    }
}
