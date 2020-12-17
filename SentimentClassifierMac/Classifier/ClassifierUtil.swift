//
//  ClassifierUtil.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Foundation
import CreateML

class ClassifierUtil {
    
    // MARK: - Private properties -
    
    private static var data: MLDataTable {
        try! MLDataTable(contentsOf: URL(fileURLWithPath: Constants.jsonFilePath))
    }
    
    private static let (trainingData, testingData) =
        data.randomSplit(by: Constants.splitProportion, seed: Constants.generatorSeed)
    
    private static var classifier: MLTextClassifier? {
        try? MLTextClassifier(
            trainingData: trainingData,
            textColumn: Constants.textColumn,
            labelColumn: Constants.labelColumn
        )
    }
    
    private static var metadata = MLModelMetadata(
        author: Constants.classifierAuthor,
        shortDescription: Constants.classifierDescription,
        version: Constants.classifierVersion
    )
}

// MARK: - Public methods -

extension ClassifierUtil {
    
    static func createClassifier() {
        saveClassifierToMemory()
    }
}

// MARK: - Private vars & methods -

private extension ClassifierUtil {
    
    static var accuracy: ClassifierAccuracy? {
        
        guard let classifier = classifier else { return nil }
        
        // metrics
        let evaluationMetrics = classifier.evaluation(
            on: testingData,
            textColumn: Constants.textColumn,
            labelColumn: Constants.labelColumn
        )
        
        // accuracy
        return ClassifierAccuracy(
            evaluation: (1.0 - evaluationMetrics.classificationError) * 100,
            training: (1.0 - classifier.trainingMetrics.classificationError) * 100,
            validation: (1.0 - classifier.validationMetrics.classificationError) * 100
        )
    }
    
    static func saveClassifierToMemory() {
                
        FileManager.default.createFile(atPath: Constants.classifierFilePath, contents: nil)
        
        metadata.additional = accuracy?.dictionary

        try? classifier?.write(
            to: URL(fileURLWithPath: Constants.classifierFilePath),
            metadata: metadata
        )
    }
}
