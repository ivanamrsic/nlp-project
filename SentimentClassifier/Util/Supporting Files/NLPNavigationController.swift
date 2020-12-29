//
//  NLPNavigationController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 28.12.2020..
//

import UIKit

class NLPNavigationController: UINavigationController {

    var tabBarProperty: TabBarProperty?
}

enum TabBarProperty {
    case languages
    case classifier
    case profile
    case settings

    var item: UITabBarItem {
        switch self {
        case .languages:
            return UITabBarItem(
                title: "Languages",
                image: UIImage.TabBar.language,
                selectedImage: UIImage.TabBar.languageSelected
            )
        case .classifier:
            return UITabBarItem(
                title: "Classifier",
                image: UIImage.TabBar.classifier,
                selectedImage: UIImage.TabBar.classifier
            )
        case .profile:
            return UITabBarItem(
                title: "Profile",
                image: UIImage.TabBar.user,
                selectedImage: UIImage.TabBar.user
            )
        case .settings:
            return UITabBarItem(
                title: "Settings",
                image: UIImage.TabBar.settings,
                selectedImage: UIImage.TabBar.settings
            )
        }
    }
}
