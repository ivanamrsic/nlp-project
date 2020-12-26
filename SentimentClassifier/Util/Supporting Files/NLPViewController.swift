//
//  NLPViewController.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit

class NLPViewController: UIViewController {
    
    var tabBarProperty: TabBarProperty?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

enum TabBarProperty {
    case languages
    case classifier
    case profile
    
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
        }
    }
}
