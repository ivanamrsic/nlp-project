//
//  ClassifierDetailsPresenter.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 30.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ClassifierDetailsPresenter {

    // MARK: - Private properties

    private unowned let view: ClassifierDetailsViewInterface
    private let interactor: ClassifierDetailsInteractorInterface
    private let wireframe: ClassifierDetailsWireframeInterface

    private let ClassifierInfo: ClassifierInfo

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init(view: ClassifierDetailsViewInterface, interactor: ClassifierDetailsInteractorInterface, wireframe: ClassifierDetailsWireframeInterface, ClassifierInfo: ClassifierInfo) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.ClassifierInfo = ClassifierInfo
    }
}

// MARK: - ClassifierDetailsPresenterInterface

extension ClassifierDetailsPresenter: ClassifierDetailsPresenterInterface {

    var data: ClassifierInfo {
        return ClassifierInfo
    }

    func configure(with output: ClassifierDetails.ViewOutput) -> ClassifierDetails.ViewInput {
        handle(openLink: output.openLinkAction)
        return ClassifierDetails.ViewInput()
    }

}

// MARK: - Binding Setup

private extension ClassifierDetailsPresenter {

    func handle(openLink: Signal<Void>) {
        openLink
            .map { [unowned self] in self.data.dataInfo.dataLink }
            .compactMap { URL(string: $0) }
            .emit(onNext: { [unowned wireframe] in wireframe.open(url: $0) })
            .disposed(by: disposeBag)
    }
}
