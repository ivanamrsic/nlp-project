//
//  Classifier.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Foundation
import CreateML
import CoreML

class Classifier {
    
    typealias Metadata = [String: String]
    
    // MARK: - Public properties -
    
    var accuracy: ClassifierAccuracy? {
        createAccuracy(from: metadata)
    }
    
    // MARK: - Private properties -
        
    private var sentimentClassifier: SentimentClassifier? {
        try? SentimentClassifier(configuration: MLModelConfiguration())
    }
    
    private var metadata: Metadata? {
        let modelDescription = sentimentClassifier?.model.modelDescription
        return modelDescription?.metadata[MLModelMetadataKey.creatorDefinedKey] as? Metadata
    }
}

// MARK: - Public methods -

extension Classifier {
    
    func classify(text: String) -> ClassifierResult {
        let result = try? sentimentClassifier?.prediction(text: text)
        return ClassifierResult(result: result?.label)
    }
}

// MARK: - Private methods -

private extension Classifier {
    
    func createAccuracy(from metadata: Metadata?) -> ClassifierAccuracy? {
        guard let metadata = metadata else { return nil }
        return ClassifierAccuracy(
            evaluation: metadata["evaluation"],
            training: metadata["training"],
            validation: metadata["validation"]
        )
    }
}
