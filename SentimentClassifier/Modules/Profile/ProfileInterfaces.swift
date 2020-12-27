//
//  ProfileInterfaces.swift
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

protocol ProfileWireframeInterface: WireframeInterface {
    func openChoosePhoto()
    func openCreateReview() -> Signal<Void>
    func openFilterReviews(with delegate: FilterDelegate)
}

protocol ProfileViewInterface: ViewInterface {
}

protocol ProfilePresenterInterface: PresenterInterface {
    func configure(with output: Profile.ViewOutput) -> Profile.ViewInput
}

protocol ProfileInteractorInterface: InteractorInterface {
    var profilePhoto: Driver<String?> { get }
    func fetchReviews() -> Single<[Review]>
    func delete(review: Review)
}

enum Profile {

    struct ViewOutput {
        let choosePhotoAction: Signal<Void>
        let createReviewAction: Signal<Void>
        let filterReviewsAction: Signal<Void>
        let viewWillAppear: Signal<Void>
    }

    struct ViewInput {
        let items: Driver<[TableCellItem]>
        let image: Driver<String?>
        let reviewCount: Driver<Int>
    }
}
