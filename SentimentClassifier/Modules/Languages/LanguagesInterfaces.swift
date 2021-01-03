//
//  LanguagesInterfaces.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa
import NaturalLanguage

typealias LanguagePossibility = (language: NLLanguage, pct: Double)
typealias ReadableLanguagePossibility = (language: String, pct: Double)

protocol LanguagesWireframeInterface: WireframeInterface {
}

protocol LanguagesViewInterface: ViewInterface {
}

protocol LanguagesPresenterInterface: PresenterInterface {
    func configure(with output: Languages.ViewOutput) -> Languages.ViewInput
}

protocol LanguagesInteractorInterface: InteractorInterface {
    func getLanguage(for text: String?) -> [(language: NLLanguage, pct: Double)]
}

enum Languages {

    struct ViewOutput {
        let inputText: Driver<String?>
        let viewWillAppear: Signal<Void>
    }

    struct ViewInput {
        let firstPossibleLanguages: Driver<ReadableLanguagePossibility?>
        let secondPossibleLanguages: Driver<ReadableLanguagePossibility?>
        let thirdPossibleLanguages: Driver<ReadableLanguagePossibility?>
    }
}
