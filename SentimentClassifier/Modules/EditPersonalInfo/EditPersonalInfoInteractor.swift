//
//  EditPersonalInfoInteractor.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class EditPersonalInfoInteractor {
}

// MARK: - EditPersonalInfoInteractorInterface

extension EditPersonalInfoInteractor: EditPersonalInfoInteractorInterface {

    var username: Driver<String?> {
        return UserStoreManager.usernameDriver
    }

    var email: Driver<String?> {
        return UserStoreManager.emailDriver
    }

    func updateData(username: String?, email: String?) {
        if let username = username, username.count > 0 {
            UserStoreManager.username = username
        }
        if let email = email, email.count > 0 {
            UserStoreManager.email = email
        }
    }

}
