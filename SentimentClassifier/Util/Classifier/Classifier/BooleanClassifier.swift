//
//  BooleanClassifier.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import Foundation
import CoreML

class BooleanClassifier {

    // MARK: - Private propeties

    private static var instance = BooleanClassifier()

    private var sentimentClassifier: SentimentClassifier?

    // MARK: - Init

    private init() {
        sentimentClassifier = try? SentimentClassifier(configuration: MLModelConfiguration())
    }
}

private extension BooleanClassifier {

    var modelDescription: MLModelDescription? {
        return sentimentClassifier?.model.modelDescription
    }

    func classify(text: String) -> String? {
        return try? sentimentClassifier?.prediction(text: text).label
    }
}

// MARK: - CustomClassifier

extension BooleanClassifier: CustomClassifier {

    static var allResults: [String] {
        return [
            Strings.positive,
            Strings.negative
        ]
    }

    static var data: ClassifierInfo {
        ClassifierInfo(
            name: "Binary sentiment classification",
            type: .boolean,
            dataInfo: dataInfo,
            accuracy: accuracy,
            labels: allResults
        )
    }

    static var metadata: [String: String]? {
        return BooleanClassifier.instance
            .modelDescription?
            .metadata[MLModelMetadataKey.creatorDefinedKey] as? [String: String]
    }

    static func classify(text: String) -> String {

        let result = BooleanClassifier.instance.classify(text: text) ?? "0"

        guard let value = Int(result) else {
            return Strings.undefined
        }

        if value != 1 && value != -1 {
            return Strings.undefined
        }

        return value == 1 ? Strings.positive : Strings.negative
    }
}

private extension BooleanClassifier {

    static var dataInfo: DataInfo {
        DataInfo(
            dataName: "Large Movie Review Dataset",
            dataPointsCount: 50000,
            trainingPercentage: 80,
            testingPercentage: 20,
            dataLink: "https://ai.stanford.edu/~amaas/data/sentiment/",
            authors: author
        )
    }

    static var author: Author {
        Author(
            author: "Maas, Andrew L.  and  Daly, Raymond E.  and  Pham, Peter T.  and  Huang, Dan  and  Ng, Andrew Y.  and  Potts, Christopher",
            title: "Learning Word Vectors for Sentiment Analysis",
            bookTitle: "Proceedings of the 49th Annual Meeting of the Association for Computational Linguistics: Human Language Technologies",
            month: 6,
            year: 2011,
            address: "Portland, Oregon, USA",
            publisher: "Association for Computational Linguistics",
            pages: "142--150",
            url: "http://www.aclweb.org/anthology/P11-1015"
        )
    }
}
