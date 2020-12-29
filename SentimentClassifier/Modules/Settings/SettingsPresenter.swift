//
//  SettingsPresenter.swift
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

final class SettingsPresenter {

    // MARK: - Private properties

    private unowned let view: SettingsViewInterface
    private let interactor: SettingsInteractorInterface
    private let wireframe: SettingsWireframeInterface

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init(view: SettingsViewInterface, interactor: SettingsInteractorInterface, wireframe: SettingsWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - SettingsPresenterInterface

extension SettingsPresenter: SettingsPresenterInterface {

    func configure(with output: Settings.ViewOutput) -> Settings.ViewInput {
        return Settings.ViewInput(
            sections: createSections(with: output.viewWillAppear)
        )
    }
}

// MARK: - Sections creation

private extension SettingsPresenter {

    func createSections(with refresh: Signal<Void>) -> Driver<[TableSectionItem]> {
        return Driver.combineLatest(
                interactor.language,
                refresh.asDriver(onErrorDriveWith: .empty()),
                resultSelector: { (language, _) in language }
            )
            .startWith(interactor.currentLanguage)
            .map { _ in
                [
                    self.imageSelectionSection(),
                    self.languageSelectionSection()
                ]
            }
    }

    func imageSelectionSection() -> TableSectionItem {

        let item = ImageSelectionCellItem(photos: interactor.allPhotos, selectedPhoto: interactor.selectedPhoto)

        item.selectedValue
            .drive(onNext: { [unowned interactor] in interactor.selectedPhoto = $0 })
            .disposed(by: disposeBag)

        return TitleTableSection(
            items: [item],
            title: Strings.chooseProfilePhoto
        )
    }

    func languageSelectionSection() -> TableSectionItem {

        let languageItem = LanguageSelectionCellItem(
            language: interactor.currentLanguage,
            options: Language.allOptions,
            didSet: { [unowned interactor] in interactor.currentLanguage = $0 }
        )

        return TitleTableSection(
            items: [languageItem],
            title: Strings.chooseAppLanguage
        )
    }
}
