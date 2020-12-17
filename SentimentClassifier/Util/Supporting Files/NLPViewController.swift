//
//  NLPViewController.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit

class NLPViewController: UIViewController {
    
    var tabBarProperty: TabBarProperty?
}

enum TabBarProperty {
    case languages
    case classifier
    
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
        }
    }
}
