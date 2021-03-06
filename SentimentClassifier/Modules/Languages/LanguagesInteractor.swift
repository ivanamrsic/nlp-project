//
//  LanguagesInteractor.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import NaturalLanguage

final class LanguagesInteractor {

    private let recognizer: NLLanguageRecognizer

    init(recognizer: NLLanguageRecognizer = NLLanguageRecognizer()) {
        self.recognizer = recognizer
    }
}

// MARK: - LanguagesInteractorInterface

extension LanguagesInteractor: LanguagesInteractorInterface {

    func getLanguage(for text: String?) -> [LanguagePossibility] {

        guard let text = text else { return [] }

        recognizer.reset()
        recognizer.processString(text)

        let possibilities = recognizer.languageHypotheses(withMaximum: 3)

        return possibilities
            .map { (key, value) -> LanguagePossibility in (key, value) }
            .sorted { $0.pct > $1.pct }
    }
}
