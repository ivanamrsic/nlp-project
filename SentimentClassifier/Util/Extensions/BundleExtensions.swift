//
//  BundleExtensions.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit

extension Bundle {

    func load<T : UIView>(viewOfType _: T.Type, name: String? = nil) -> T {
        let viewName = name ?? String(describing: T.self)
        return loadNibNamed(viewName, owner: nil, options: nil)!.first as! T
    }
}
