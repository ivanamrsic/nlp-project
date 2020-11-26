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
    
    var item: UITabBarItem {
        switch self {
        case .languages:
            return UITabBarItem(
                title: "Languages",
                image: UIImage.TabBar.language,
                selectedImage: UIImage.TabBar.languageSelected
            )
        }
    }
}
