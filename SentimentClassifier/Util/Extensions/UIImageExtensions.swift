//
//  UIImageExtensions.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit

extension UIImage {
    
    struct TabBar {
        static var language: UIImage {
            return UIImage(named: "TabBarItems/language")!
        }
        
        static var languageSelected: UIImage {
            return UIImage(named: "TabBarItems/language-selected")!
        }
        
        static var classifier: UIImage {
            return UIImage(named: "TabBarItems/classifier")!
        }

        static var user: UIImage {
            return UIImage(named: "TabBarItems/user")!
        }
    }

    struct Profile {
        static var caveman: UIImage {
            return UIImage(named: "Profile/caveman")!
        }
    }

    struct Common {
        static var add: UIImage {
            return UIImage(named: "Common/add")!
        }
    }
    
}


