//
//  ClassifierPresenter.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 17.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class ClassifierPresenter {

    // MARK: - Private properties -

    private unowned let view: ClassifierViewInterface
    private let interactor: ClassifierInteractorInterface
    private let wireframe: ClassifierWireframeInterface

    // MARK: - Lifecycle -

    init(view: ClassifierViewInterface, interactor: ClassifierInteractorInterface, wireframe: ClassifierWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ClassifierPresenter: ClassifierPresenterInterface {

    func configure(with output: Classifier.ViewOutput) -> Classifier.ViewInput {
        let result = handle(classifyAction: output.classifyAction)
        return Classifier.ViewInput(result: result)
    }

}

private extension ClassifierPresenter {
    
    func handle(classifyAction: Signal<String?>) -> Driver<String?> {
        return classifyAction
            .compactMap { $0 }
            .map { ClassifierModel().classify(text: $0).description }
            .asDriver(onErrorDriveWith: .empty())
    }
}
