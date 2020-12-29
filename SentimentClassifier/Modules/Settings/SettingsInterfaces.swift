//
//  SettingsInterfaces.swift
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

protocol SettingsWireframeInterface: WireframeInterface {
}

protocol SettingsViewInterface: ViewInterface {
}

protocol SettingsPresenterInterface: PresenterInterface {
    func configure(with output: Settings.ViewOutput) -> Settings.ViewInput
}

protocol SettingsInteractorInterface: InteractorInterface {
    var currentLanguage: Language { get set }
    var language: Driver<Language> { get }
    var allPhotos: [ProfilePhoto] { get }
    var selectedPhoto: ProfilePhoto { get set }
}

enum Settings {

    struct ViewOutput {
    }

    struct ViewInput {
        let sections: Driver<[TableSectionItem]>
    }

}
