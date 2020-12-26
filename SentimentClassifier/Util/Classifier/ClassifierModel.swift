//
//  Classifier.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Foundation
import CoreML

class ClassifierModel {
    
    // MARK: - Private properties -
        
    private var sentimentClassifier: SentimentClassifierMac? {
        try? SentimentClassifierMac(configuration: MLModelConfiguration())
    }
}

// MARK: - Public methods -

extension ClassifierModel {
    
    func classify(text: String) -> ClassifierResultScale {
        let result = try? sentimentClassifier?.prediction(text: text)
        return ClassifierResultScale(result: result?.label)
    }
}
