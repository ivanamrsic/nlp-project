//
//  Strings.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct Strings {
    private static func chooseTranslation(eng: String, cro: String) -> String {
        switch UserStoreManager.language {
        case .english: return eng
        case .croatian: return cro
        }
    }
}

// MARK: - Basic action -

extension Strings {

    static var done: String {
        chooseTranslation(eng: "Done", cro: "Gotovo")
    }

    static var save: String {
        chooseTranslation(eng: "Save", cro: "Spremi")
    }

    static var create: String {
        chooseTranslation(eng: "Create", cro: "Kreiraj")
    }

    static var general: String {
        chooseTranslation(eng: "General", cro: "Opcenito")
    }

    static var moreDetails: String {
        chooseTranslation(eng: "More details", cro: "Vise detalja")
    }
}

// MARK: - Complex actions -

extension Strings {

    static var chooseClassifier: String {
        chooseTranslation(eng: "Choose Classifier", cro: "Odaberi klasifikator")
    }

    static var editPersonalInfo: String {
        chooseTranslation(eng: "Edit personal info", cro: "Uredi osobni podatke")
    }

    static var chooseAppLanguage: String {
        chooseTranslation(eng: "Choose language in the app", cro: "Odaberi jezik aplikacije")
    }

    static var chooseProfilePhoto: String {
        chooseTranslation(eng: "Choose profile photo", cro: "Odaberi sliku profila")
    }

    static var searchForAMovie: String {
        chooseTranslation(eng: "Search for a movie...", cro: "Pretrazite filmove...")
    }

    static var createReview: String {
        chooseTranslation(eng: "Create review", cro: "Stvori recenziju")
    }
}

// MARK: - Properties -

extension Strings {

    static var movieTitle: String {
        chooseTranslation(eng: "Movie title", cro: "Naslov filma")
    }

    static var movieYear: String {
        chooseTranslation(eng: "Movie year", cro: "Godina filma")
    }

    static var reviewTitle: String {
        chooseTranslation(eng: "Review title", cro: "Naslov recenzije")
    }

    static var usernameTitle: String {
        chooseTranslation(eng: "Username", cro: "Korisnicko ime")
    }

    static var emailTitle: String {
        chooseTranslation(eng: "E-mail", cro: "E-posta")
    }

    static var classifier: String {
        chooseTranslation(eng: "Classifier", cro: "Klasifikator")
    }

    static var personalInfo: String {
        chooseTranslation(eng: "Personal info", cro: "Osobni podaci")
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
}

// MARK: - Classifier -

extension Strings {

    // MARK: - Data

    static var data: String {
        chooseTranslation(eng: "Data", cro: "Podaci")
    }

    static var dataName: String {
        chooseTranslation(eng: "Name", cro: "Ime")
    }

    static var dataPointsCount: String {
        chooseTranslation(eng: "No. of data points", cro: "Broj podataka")
    }

    static var dataTrainingPercentage: String {
        chooseTranslation(eng: "Training pct.", cro: "Broj podataka")
    }

    static var dataTestingPercentage: String {
        chooseTranslation(eng: "Testing pct.", cro: "Broj podataka")
    }

    // MARK: - Accuracy

    static var accuracy: String {
        chooseTranslation(eng: "Accuracy", cro: "Tocnost")
    }

    static var evaluation: String {
        chooseTranslation(eng: "Evaluation", cro: "Evaluacija")
    }

    static var training: String {
        chooseTranslation(eng: "Training", cro: "Trening")
    }

    static var validation: String {
        chooseTranslation(eng: "Validation", cro: "Validacija")
    }
}

// MARK: - Classifier results -

extension Strings {

    static var undefined: String {
        chooseTranslation(eng: "Undefinded", cro: "Nedefinirano")
    }

    // MARK: - Boolean

    static var negative: String {
        chooseTranslation(eng: "Negative", cro: "Negativno")
    }

    static var positive: String {
        chooseTranslation(eng: "Positive", cro: "Pozitivno")
    }

    // MARK: - Scale

    static var extremlySatisfied: String {
        chooseTranslation(eng: "Extremly satisfied", cro: "Jako zadovoljan")
    }

    static var satisfied: String {
        chooseTranslation(eng: "Satisfied", cro: "Zadovoljan")
    }

    static var neutral: String {
        chooseTranslation(eng: "Neutral", cro: "Neutralan")
    }

    static var unsatisfied: String {
        chooseTranslation(eng: "Unsatisfied", cro: "Nezadovoljan")
    }

    static var extremlyUnsatisfied: String {
        chooseTranslation(eng: "Extremly unsatisfied", cro: "Jako nezadovoljan")
    }
}

// MARK: - Profile photo names -

extension Strings {

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
}

// MARK: - Filter -

extension Strings {

    static var filterBySentiment: String {
        chooseTranslation(eng: "By sentiment", cro: "Po sentimentu")
    }

    static var filterReviewsTitle: String {
        chooseTranslation(eng: "Filter reviews", cro: "Filtriraj recenzije")
    }

    static var filterAction: String {
        chooseTranslation(eng: "Filter", cro: "Filtriraj")
    }
}
