//
//  ChooseClassifierPresenter.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ChooseClassifierPresenter {

    // MARK: - Private properties

    private unowned let view: ChooseClassifierViewInterface
    private let interactor: ChooseClassifierInteractorInterface
    private let wireframe: ChooseClassifierWireframeInterface

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init(view: ChooseClassifierViewInterface, interactor: ChooseClassifierInteractorInterface, wireframe: ChooseClassifierWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - ChooseClassifierPresenterInterface

extension ChooseClassifierPresenter: ChooseClassifierPresenterInterface {

    func configure(with output: ChooseClassifier.ViewOutput) -> ChooseClassifier.ViewInput {
        return ChooseClassifier.ViewInput(items: .just(createItems()))
    }
}

// MARK: - Items Creation

private extension ChooseClassifierPresenter {

    func createItems() -> [TableCellItem] {

        let didSelectClassifier = BehaviorRelay<ClassifierModelType>(value: interactor.currentClassifier)

        handle(chooseClassifier: didSelectClassifier.asDriver(onErrorDriveWith: .empty()))

        let toItems: (ClassifierInfo) -> TableCellItem = { [unowned self] in
            self.createItem(with: $0, didSelectClassifier: didSelectClassifier)
        }

        return interactor.allClassifiers.map(toItems)
    }

    func createItem(
        with data: ClassifierInfo,
        didSelectClassifier: BehaviorRelay<ClassifierModelType>
    ) -> TableCellItem {
        ClassifierDescriptionCellItem(
             title: data.name,
             isSelectedClassifier: interactor.classifierDriver.map { $0 == data.type },
             didSelectClassifier: { didSelectClassifier.accept(data.type) },
             didSelectDetails: { [unowned wireframe] in wireframe.openClassifierDetails(with: data) }
        )
    }
}

// MARK: - Binding setup

private extension ChooseClassifierPresenter {

    func handle(chooseClassifier: Driver<ClassifierModelType>) {
        chooseClassifier
            .drive(onNext: { [unowned interactor] in interactor.currentClassifier = $0 })
            .disposed(by: disposeBag)
    }
}
