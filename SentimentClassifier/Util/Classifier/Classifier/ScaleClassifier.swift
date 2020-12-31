//
//  ScaleClassifier.swift
//  SentimentClassifierMac
//
//  Created by Ivana Mršić on 17.12.2020..
//

import Foundation
import CoreML

class ScaleClassifier {

    // MARK: - Private properties

    private static var instance = ScaleClassifier()

    private var sentimentClassifier: SentimentClassifierMac?

    // MARK: - Init

    private init() {
        sentimentClassifier = try? SentimentClassifierMac(configuration: MLModelConfiguration())
    }
}

private extension ScaleClassifier {

    var modelDescription: MLModelDescription? {
        return sentimentClassifier?.model.modelDescription
    }

    func classify(text: String) -> String? {
        return try? sentimentClassifier?.prediction(text: text).label
    }
}

// MARK: - CustomClassifier

extension ScaleClassifier: CustomClassifier {

    static var allResults: [String] {
        return [
            Strings.extremlySatisfied,
            Strings.satisfied,
            Strings.neutral,
            Strings.unsatisfied,
            Strings.extremlyUnsatisfied
        ]
    }

    static var data: ClassifierInfo {
        ClassifierInfo(
            name: "Scale classifier",
            dataInfo: dataInfo,
            accuracy: accuracy,
            labels: allResults
        )
    }

    static var metadata: [String: String]? {
        return ScaleClassifier.instance
            .modelDescription?.metadata[MLModelMetadataKey.creatorDefinedKey] as? [String: String]
    }

    static func classify(text: String) -> String {

        let result = ScaleClassifier.instance.classify(text: text) ?? "0"

        guard let value = Int(result) else {
            return Strings.undefined
        }

        if value < 1 && value > 5 { return Strings.undefined }

        if value == 1 { return Strings.extremlyUnsatisfied }
        else if value == 2 { return Strings.unsatisfied }
        else if value == 3 { return Strings.neutral }
        else if value == 4 { return Strings.satisfied }

        return Strings.extremlySatisfied
    }
}

private extension ScaleClassifier {

    static var dataInfo: DataInfo {
        DataInfo(
            dataName: "Yelp Open Dataset",
            dataPointsCount: 50000,
            trainingPercentage: 80,
            testingPercentage: 20,
            dataLink: "https://www.yelp.com/dataset",
            authors: nil
        )
    }
}
