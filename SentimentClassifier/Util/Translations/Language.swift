//
//  Language.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
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
