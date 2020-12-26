//
//  ChoosePhotoPresenter.swift
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

final class ChoosePhotoPresenter {

    // MARK: - Private properties -

    private unowned let view: ChoosePhotoViewInterface
    private let interactor: ChoosePhotoInteractorInterface
    private let wireframe: ChoosePhotoWireframeInterface

    // MARK: - Lifecycle -

    init(view: ChoosePhotoViewInterface, interactor: ChoosePhotoInteractorInterface, wireframe: ChoosePhotoWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ChoosePhotoPresenter: ChoosePhotoPresenterInterface {

    func configure(with output: ChoosePhoto.ViewOutput) -> ChoosePhoto.ViewInput {
        return ChoosePhoto.ViewInput(
            items: .just(createItems())
        )
    }

}

private extension ChoosePhotoPresenter {

    func createItems() -> [TableCellItem] {

        let didSelect: (ProfilePhoto) -> Void = { [unowned interactor, unowned wireframe] photo in
            interactor.save(photo: photo)
            wireframe.dismiss()
        }

        return [
            PhotoCellItem(photo: .caveman, didSelect: didSelect),
            PhotoCellItem(photo: .trash, didSelect: didSelect),
            PhotoCellItem(photo: .chinchilla, didSelect: didSelect),
            PhotoCellItem(photo: .edvardMunch, didSelect: didSelect),
            PhotoCellItem(photo: .iceCream, didSelect: didSelect)
        ]
    }
}