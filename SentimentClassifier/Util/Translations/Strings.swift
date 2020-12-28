//
//  Strings.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

enum Language: String {
    case english = "English"
    case croatian = "Hrvatski"

    static func get(from string: String) -> Language {
        if string == Language.english.rawValue {
            return .english
        }

        return .croatian
    }

    static var allOptions: [Language] {
        return [.english, .croatian]
    }

    var image: UIImage? {
        switch self {
        case .english: return UIImage.Flag.greatBritain
        case .croatian: return UIImage.Flag.croatia
        }
    }
}

struct Strings {

    static var done: String {
        chooseTranslation(eng: "Done", cro: "Gotovo")
    }

    static var chooseAppLanguage: String {
        chooseTranslation(eng: "Choose language in the app", cro: "Odaberi jezik aplikacije")
    }

    static var chooseProfilePhoto: String {
        chooseTranslation(eng: "Choose profile photo", cro: "Odaberi sliku profila")
    }

    static var filterBySentiment: String {
        chooseTranslation(eng: "By sentiment", cro: "Po sentimentu")
    }

    static var filterReviewsTitle: String {
        chooseTranslation(eng: "Filter reviews", cro: "Filtriraj recenzije")
    }

    static var filterAction: String {
        chooseTranslation(eng: "Filter", cro: "Filtriraj")
    }

    static var searchForAMovie: String {
        chooseTranslation(eng: "Search for a movie...", cro: "Pretrazite filmove...")
    }

    static var movieTitle: String {
        chooseTranslation(eng: "Movie title", cro: "Naslov filma")
    }

    static var movieYear: String {
        chooseTranslation(eng: "Movie year", cro: "Godina filma")
    }

    static var reviewTitle: String {
        chooseTranslation(eng: "Review title", cro: "Naslov recenzije")
    }

    static var createReview: String {
        chooseTranslation(eng: "Create review", cro: "Stvori recenziju")
    }

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

    static var createReviewTitle: String {
        chooseTranslation(eng: "Create review", cro: "Stvori recenziju")
    }

    static var choosePhotoTitle: String {
        chooseTranslation(eng: "Choose profile photo", cro: "Odaberi sliku profila")
    }

    static var cavemanPhoto: String {
        chooseTranslation(eng: "Caveman", cro: "Pecinski covjek")
    }

    static var trashPhoto: String {
        chooseTranslation(eng: "Fancy Trash", cro: "Smece")
    }

    static var chinchillaPhoto: String {
        chooseTranslation(eng: "Chinchilla", cro: "Cincila")
    }

    static var edvardMunchPhoto: String {
        chooseTranslation(eng: "Edvard Munch", cro: "Edvard Munch")
    }

    static var iceCreamPhoto: String {
        chooseTranslation(eng: "Happy ice cream", cro: "Veseli sladoled")
    }

    private static func chooseTranslation(eng: String, cro: String) -> String {
        switch UserStoreManager.language {
        case .english: return eng
        case .croatian: return cro
        }
    }
}
