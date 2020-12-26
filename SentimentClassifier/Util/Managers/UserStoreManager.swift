//
//  UserStoreManager.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

class UserStoreManager {

    static let profilePhotoKey = "profilePhoto"
}

extension UserStoreManager {

    static var profilePhoto: String? {
        get {
            return UserDefaults.standard.string(forKey:profilePhotoKey)
        }
        set {
            // Save to UserDefaults
            UserDefaults.standard.set(newValue, forKey: profilePhotoKey)
        }
    }
}
