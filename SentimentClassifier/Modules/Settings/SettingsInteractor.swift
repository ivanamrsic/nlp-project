//
//  SettingsInteractor.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class SettingsInteractor {
}

// MARK: - SettingsInteractorInterface

extension SettingsInteractor: SettingsInteractorInterface {

    var language: Driver<Language> {
        return UserStoreManager.languageDriver
    }

    var currentLanguage: Language {
        get { return UserStoreManager.language }
        set(newValue) { UserStoreManager.language = newValue }
    }

    var allPhotos: [ProfilePhoto] {
        return ProfilePhoto.allPhotos
    }

    var selectedPhoto: ProfilePhoto {
        get { return UserStoreManager.profilePhoto }
        set(newValue) { UserStoreManager.profilePhoto = newValue }
    }
}
