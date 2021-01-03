//
//  Strings.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct Strings {
    static func localize(eng: String, cro: String) -> String {
        switch UserStoreManager.language {
        case .english: return eng
        case .croatian: return cro
        }
    }
}

// MARK: - Basic action -

extension Strings {

    static var done: String {
        localize(eng: "Done", cro: "Gotovo")
    }

    static var save: String {
        localize(eng: "Save", cro: "Spremi")
    }

    static var create: String {
        localize(eng: "Create", cro: "Kreiraj")
    }

    static var general: String {
        localize(eng: "General", cro: "Opcenito")
    }

    static var moreDetails: String {
        localize(eng: "More details", cro: "Vise detalja")
    }

    static var result: String {
        localize(eng: "Result", cro: "Rezultat")
    }

    static var ok: String {
        localize(eng: "Ok", cro: "Ok")
    }

    static var cancel: String {
        localize(eng: "Cancel", cro: "Ponisti")
    }
}

// MARK: - Complex actions -

extension Strings {

    static var chooseClassifier: String {
        localize(eng: "Choose Classifier", cro: "Odaberi klasifikator")
    }

    static var editPersonalInfo: String {
        localize(eng: "Edit personal info", cro: "Uredi osobni podatke")
    }

    static var chooseAppLanguage: String {
        localize(eng: "Choose language in the app", cro: "Odaberi jezik aplikacije")
    }

    static var chooseProfilePhoto: String {
        localize(eng: "Choose profile photo", cro: "Odaberi sliku profila")
    }

    static var searchForAMovie: String {
        localize(eng: "Search for a movie...", cro: "Pretrazi filmove...")
    }

    static var createReview: String {
        localize(eng: "Create review", cro: "Stvori recenziju")
    }

    static var classify: String {
        localize(eng: "Classify", cro: "Klasificiraj")
    }

    static var deleteReviews: String {
        localize(eng: "Delete Reviews", cro: "Izbrisi recenzije")
    }

    static var deleteReviewsInfo: String {
        localize(eng: "Are you sure you want to delete all reviews?", cro: "Zelis li izbrisati sve recenzije?")
    }
}

// MARK: - Properties -

extension Strings {

    static var movieTitle: String {
        localize(eng: "Movie title", cro: "Naslov filma")
    }

    static var movieYear: String {
        localize(eng: "Movie year", cro: "Godina filma")
    }

    static var reviewTitle: String {
        localize(eng: "Review title", cro: "Naslov recenzije")
    }

    static var usernameTitle: String {
        localize(eng: "Username", cro: "Korisnicko ime")
    }

    static var emailTitle: String {
        localize(eng: "E-mail", cro: "E-posta")
    }

    static var classifier: String {
        localize(eng: "Classifier", cro: "Klasifikator")
    }

    static var personalInfo: String {
        localize(eng: "Personal info", cro: "Osobni podaci")
    }

    static var ratingsCountTitle: String {
        localize(eng: "No. of ratings", cro: "Broj recenzija")
    }

    static var ratingsTitle: String {
        localize(eng: "Ratings", cro: "Recenzije")
    }

    static var scoreTitle: String {
        localize(eng: "Rating", cro: "Ocjena")
    }
}

// MARK: - Classifier -

extension Strings {

    // MARK: - Data

    static var data: String {
        localize(eng: "Data", cro: "Podaci")
    }

    static var dataName: String {
        localize(eng: "Name", cro: "Ime")
    }

    static var dataPointsCount: String {
        localize(eng: "No. of data points", cro: "Broj podataka")
    }

    static var dataTrainingPercentage: String {
        localize(eng: "Training pct.", cro: "Broj podataka")
    }

    static var dataTestingPercentage: String {
        localize(eng: "Testing pct.", cro: "Broj podataka")
    }

    // MARK: - Accuracy

    static var accuracy: String {
        localize(eng: "Accuracy", cro: "Tocnost")
    }

    static var evaluation: String {
        localize(eng: "Evaluation", cro: "Evaluacija")
    }

    static var training: String {
        localize(eng: "Training", cro: "Trening")
    }

    static var validation: String {
        localize(eng: "Validation", cro: "Validacija")
    }
}

// MARK: - Classifier results -

extension Strings {

    static var undefined: String {
        localize(eng: "Undefinded", cro: "Nedefinirano")
    }

    // MARK: - Boolean

    static var negative: String {
        localize(eng: "Negative", cro: "Negativno")
    }

    static var positive: String {
        localize(eng: "Positive", cro: "Pozitivno")
    }

    // MARK: - Scale

    static var extremlySatisfied: String {
        localize(eng: "Extremly satisfied", cro: "Jako zadovoljan")
    }

    static var satisfied: String {
        localize(eng: "Satisfied", cro: "Zadovoljan")
    }

    static var neutral: String {
        localize(eng: "Neutral", cro: "Neutralan")
    }

    static var unsatisfied: String {
        localize(eng: "Unsatisfied", cro: "Nezadovoljan")
    }

    static var extremlyUnsatisfied: String {
        localize(eng: "Extremly unsatisfied", cro: "Jako nezadovoljan")
    }
}

// MARK: - Profile photo names -

extension Strings {

    static var trashPhoto: String {
        localize(eng: "Fancy Trash", cro: "Smece")
    }

    static var picturePhoto: String {
        localize(eng: "Picture perfect", cro: "Savrsena slika")
    }

    static var puzzlePhoto: String {
        localize(eng: "Puzzle", cro: "Puzzle")
    }

    static var sunPhoto: String {
        localize(eng: "Winter sun", cro: "Zubato sunce")
    }

    static var femalePhoto: String {
        localize(eng: "Lovely Anna", cro: "Ljupka Ana")
    }

    static var malePhoto: String {
        localize(eng: "Lovely John", cro: "Ljupki Ivan")
    }
}

// MARK: - Filter -

extension Strings {

    static var filterBySentiment: String {
        localize(eng: "By sentiment", cro: "Po sentimentu")
    }

    static var filterReviewsTitle: String {
        localize(eng: "Filter reviews", cro: "Filtriraj recenzije")
    }

    static var filterAction: String {
        localize(eng: "Filter", cro: "Filtriraj")
    }
}

// MARK: - Languages Screen

extension Strings {

    static var languagesTitle: String {
        localize(eng: "Language detection", cro: "Detekcija jezika")
    }

    static var languagesInfo: String {
        localize(eng: "Find out language of your text", cro: "Saznajte jezik unesenog teksta")
    }
}

// MARK: - Classifier Screen

extension Strings {

    static var classifierScreenTitle: String {
        localize(eng: "Classify text", cro: "Klasificiraj tekst")
    }

    static var classifierInfo: String {
        localize(eng: "Determine text sentiment", cro: "Odredi sentiment teksta")
    }
}
