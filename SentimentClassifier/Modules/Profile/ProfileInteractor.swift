//
//  ProfileInteractor.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class ProfileInteractor {
}

// MARK: - Extensions -

extension ProfileInteractor: ProfileInteractorInterface {

    var profilePhoto: Driver<String?> {
        return UserDefaults.standard.rx
            .observe(String.self, UserStoreManager.profilePhotoKey)
            .debounce(.milliseconds(100), scheduler: MainScheduler.asyncInstance)
            .debug("AAAAAA", trimOutput: false)
            .asDriver(onErrorDriveWith: .empty())
    }
}
