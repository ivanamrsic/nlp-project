//
//  Strings.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import Foundation

enum Language {
    case english
    case croatian
}

struct Strings {

    static var language: Language?

    static var usernameTitle: String {
        chooseTranslation(eng: "Username", cro: "Korisnicko ime")
    }

    static var emailTitle: String {
        chooseTranslation(eng: "E-mail", cro: "E-posta")
    }

    static var ratingsCountTitle: String {
        chooseTranslation(eng: "No. of ratings", cro: "Broj recenzija")
    }

    static var ratingsTitle: String {
        chooseTranslation(eng: "Ratings", cro: "Recenzije")
    }

    static var scoreTitle: String {
        chooseTranslation(eng: "Rating", cro: "Ocjena")
    }

    private static func chooseTranslation(eng: String, cro: String) -> String {
        guard let language = language else { return "" }
        switch language {
        case .english: return eng
        case .croatian: return cro
        }
    }
}