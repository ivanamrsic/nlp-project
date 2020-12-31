//
//  ClassifierManager.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Foundation
import CoreML
import RxSwift
import RxCocoa

class ClassifierManager {

    static let shared = ClassifierManager()

    // MARK: - Private properties

    private var modelType: ClassifierModelType

    private let disposeBag = DisposeBag()

    // MARK: - Init

    private init() {
        modelType = UserStoreManager.classifier

        UserStoreManager.classifierDriver
            .drive(onNext: { [unowned self] in self.modelType = $0 })
            .disposed(by: disposeBag)
    }
}

// MARK: - Public methods

extension ClassifierManager {

    var allResults: [String] {
        switch modelType {
        case .boolean: return BooleanClassifier.allResults
        case .scale: return ScaleClassifier.allResults
        }
    }

    static var allClassifiers: [ClassifierInfo] {
        return [
            BooleanClassifier.data,
            ScaleClassifier.data
        ]
    }
    
    func classify(text: String) -> String {
        switch modelType {
        case .boolean: return BooleanClassifier.classify(text: text)
        case .scale: return ScaleClassifier.classify(text: text)
        }
    }
}
