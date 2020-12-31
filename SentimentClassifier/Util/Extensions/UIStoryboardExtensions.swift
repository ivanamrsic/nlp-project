//
//  UIStoryboardExtensions.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit

extension UIStoryboard {
    
    static var home: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: nil)
    }
    
    static var languages: UIStoryboard {
        return UIStoryboard(name: "Languages", bundle: nil)
    }
    
    static var classifier: UIStoryboard {
        return UIStoryboard(name: "Classifier", bundle: nil)
    }

    static var profile: UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }

    static var choosePhoto: UIStoryboard {
        return UIStoryboard(name: "ChoosePhoto", bundle: nil)
    }

    static var createReview: UIStoryboard {
        return UIStoryboard(name: "CreateReview", bundle: nil)
    }

    static var searchMovies: UIStoryboard {
        return UIStoryboard(name: "SearchMovies", bundle: nil)
    }

    static var filterReviews: UIStoryboard {
        return UIStoryboard(name: "FilterReviews", bundle: nil)
    }

    static var settings: UIStoryboard {
        return UIStoryboard(name: "Settings", bundle: nil)
    }

    static var editPersonalInfo: UIStoryboard {
        return UIStoryboard(name: "EditPersonalInfo", bundle: nil)
    }

    static var chooseClassifier: UIStoryboard {
        return UIStoryboard(name: "ChooseClassifier", bundle: nil)
    }

    static var classifierDetails: UIStoryboard {
        return UIStoryboard(name: "ClassifierDetails", bundle: nil)
    }
}
