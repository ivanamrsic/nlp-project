//
//  AppDelegate.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 18.11.2020..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if UserStoreManager.username == nil {
            UserStoreManager.username = "-"
        }
        
        if UserStoreManager.email == nil {
            UserStoreManager.email = "-"
        }

        return true
    }
}
