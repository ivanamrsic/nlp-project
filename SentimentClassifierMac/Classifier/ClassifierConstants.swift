//
//  ClassifierConstants.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Foundation

extension ClassifierUtil {
    
    struct Constants {
        static let textColumn = "text"
        static let labelColumn = "label"
        
        static let jsonFilePath =
            Bundle.main.paths(forResourcesOfType: "json", inDirectory: nil).first!
        
        static let splitProportion = 0.8
        static let generatorSeed = 5
        
        static let classifierFilePath = "./SentimentClassifierMac.mlmodel"
        
        static let classifierAuthor = "Ivana Mrsic"
        static let classifierVersion = "1.0"
        static let classifierDescription = "A model trained to classify movie review sentiment"
    }
}
