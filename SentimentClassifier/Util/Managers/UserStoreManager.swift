//
//  UserStoreManager.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

class UserStoreManager {

    static let profilePhotoKey = "profilePhoto"
    static let languageKey = "language"
}

extension UserStoreManager {

    static var profilePhoto: String? {
        get {
            return UserDefaults.standard.string(forKey:profilePhotoKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: profilePhotoKey)
        }
    }

    static var language: Language {
        get {
            return Language.get(from: UserDefaults.standard.string(forKey: languageKey) ?? "english")
        }
        set(newValue) {
            let value = newValue.rawValue
            UserDefaults.standard.set(value, forKey: languageKey)
        }
    }
}

extension UserStoreManager {

    static var languageDriver: Driver<Language> {
        return UserDefaults.standard.rx
            .observe(String.self, UserStoreManager.languageKey)
            .asDriver(onErrorDriveWith: .empty())
            .compactMap { Language.get(from: $0!) }
            .distinctUntilChanged()

    }
}
