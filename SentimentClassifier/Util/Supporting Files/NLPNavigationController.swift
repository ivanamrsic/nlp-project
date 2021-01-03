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
    case createReview
    case profile
    case settings

    var item: UITabBarItem {
        switch self {
        case .languages:
            return UITabBarItem(
                title: nil,
                image: UIImage.TabBar.language,
                selectedImage: UIImage.TabBar.language
            )
        case .classifier:
            return UITabBarItem(
                title: nil,
                image: UIImage.TabBar.classifier,
                selectedImage: UIImage.TabBar.classifier
            )
        case .createReview:
            return UITabBarItem(
                title: nil,
                image: UIImage.TabBar.createReview,
                selectedImage: UIImage.TabBar.createReview
            )
        case .profile:
            return UITabBarItem(
                title: nil,
                image: UIImage.TabBar.user,
                selectedImage: UIImage.TabBar.user
            )
        case .settings:
            return UITabBarItem(
                title: nil,
                image: UIImage.TabBar.settings,
                selectedImage: UIImage.TabBar.settings
            )
        }
    }
}
