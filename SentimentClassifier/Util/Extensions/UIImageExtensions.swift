//
//  UIImageExtensions.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit

extension UIImage {

    static var moviePlaceholder: UIImage {
        return UIImage(named: "movie-placeholder")!
    }
    
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

        static var settings: UIImage {
            return UIImage(named: "TabBarItems/gear")!
        }

        static var createReview: UIImage {
            return UIImage(named: "TabBarItems/plus")!
        }
    }

    struct Common {
        static var add: UIImage {
            return UIImage(named: "Common/add")!
        }
    }

    struct Flag {
        static var croatia: UIImage {
            return UIImage(named: "Flags/croatia")!
        }

        static var greatBritain: UIImage {
            return UIImage(named: "Flags/great-britain")!
        }
    }
    
}


