//
//  ClassifierAccuracy.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 30.12.2020..
//

import Foundation

struct ClassifierAccuracy {

    // MARK: - Properties -

    let evaluation: Double
    let training: Double
    let validation: Double

    var dictionary: [String: String]? {
        [
            "evaluation": String(evaluation),
            "training": String(training),
            "validation": String(validation),
        ]
    }

    // MARK: - Initialization -

    init(evaluation: String?, training: String?, validation: String?) {
        self.evaluation = Double(evaluation ?? "0") ?? 0
        self.training = Double(training ?? "0") ?? 0
        self.validation = Double(validation ?? "0") ?? 0
    }

    init(evaluation: Double, training: Double, validation: Double) {
        self.evaluation = evaluation
        self.training = training
        self.validation = validation
    }
}
