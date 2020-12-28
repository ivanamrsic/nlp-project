//
//  FilterReviewsInterfaces.swift
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

protocol FilterDelegate {
    var currentFilters: [ClassifierResultScale] { get }
    func process(sentimentFilters: [ClassifierResultScale])
}

protocol FilterReviewsWireframeInterface: WireframeInterface {
    func dismiss()
}

protocol FilterReviewsViewInterface: ViewInterface {
}

protocol FilterReviewsPresenterInterface: PresenterInterface {
    func configure(with output: FilterReviews.ViewOutput) -> FilterReviews.ViewInput
}

protocol FilterReviewsInteractorInterface: InteractorInterface {
}

enum FilterReviews {

    struct ViewOutput {
        let filterAction: Signal<Void>
    }

    struct ViewInput {
        let items: Driver<[TableCellItem]>
    }

}