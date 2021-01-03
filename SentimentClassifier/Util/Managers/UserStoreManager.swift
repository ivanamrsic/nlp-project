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
    static let usernameKey = "username"
    static let emailKey = "email"
    static let classifierKey = "classifier"
}

extension UserStoreManager {

    static var profilePhoto: ProfilePhoto {
        get {
            let id = UserDefaults.standard.integer(forKey:profilePhotoKey)
            return ProfilePhoto.get(from: id)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue.id, forKey: profilePhotoKey)
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

    static var username: String? {
        get { return UserDefaults.standard.string(forKey: usernameKey) }
        set(newValue) { UserDefaults.standard.set(newValue.orEmptyValue, forKey: usernameKey) }
    }

    static var email: String? {
        get { return UserDefaults.standard.string(forKey: emailKey) }
        set(newValue) { UserDefaults.standard.set(newValue.orEmptyValue, forKey: emailKey) }
    }

    static var classifier: ClassifierModelType {
        get {
            let value = UserDefaults.standard.string(forKey: classifierKey)
            return ClassifierModelType.get(from: value)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue.rawValue, forKey: classifierKey)
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

    static var profilePhotoDriver: Driver<ProfilePhoto> {
        return UserDefaults.standard.rx
            .observe(Int.self, UserStoreManager.profilePhotoKey)
            .asDriver(onErrorDriveWith: .empty())
            .compactMap { ProfilePhoto.get(from: $0!) }
            .distinctUntilChanged()
    }

    static var usernameDriver: Driver<String?> {
        return UserDefaults.standard.rx
            .observe(String.self, UserStoreManager.usernameKey)
            .asDriver(onErrorDriveWith: .empty())
            .distinctUntilChanged()
    }

    static var emailDriver: Driver<String?> {
        return UserDefaults.standard.rx
            .observe(String.self, UserStoreManager.emailKey)
            .asDriver(onErrorDriveWith: .empty())
            .distinctUntilChanged()
    }

    static var classifierDriver: Driver<ClassifierModelType> {
        return UserDefaults.standard.rx
            .observe(String.self, UserStoreManager.classifierKey)
            .asDriver(onErrorDriveWith: .empty())
            .compactMap { ClassifierModelType.get(from: $0) }
            .distinctUntilChanged()
    }
}
