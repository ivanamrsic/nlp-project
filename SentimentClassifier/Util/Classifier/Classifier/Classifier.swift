//
//  Classifier.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import Foundation
import RxSwift
import RxCocoa

protocol CustomClassifier {

    // MARK: - Properties

    static var allResults: [String] { get }
    static var data: ClassifierInfo { get }
    static var metadata: [String: String]? { get }

    // MARK: - Methods

    static func classify(text: String) -> String
}

extension CustomClassifier {

    static var accuracy: ClassifierAccuracy? {
        guard let metadata = metadata else { return nil }
        return ClassifierAccuracy(
            evaluation: metadata["evaluation"],
            training: metadata["training"],
            validation: metadata["validation"]
        )
    }
}
