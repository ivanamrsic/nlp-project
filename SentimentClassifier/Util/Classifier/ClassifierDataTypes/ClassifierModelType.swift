//
//  ClassifierModelType.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import Foundation

enum ClassifierModelType: String {
    case boolean = "boolean"
    case scale = "scale"
}

extension ClassifierModelType {

    static func get(from name: String?) -> ClassifierModelType {

        guard let name = name else { return .boolean }

        if name == ClassifierModelType.boolean.rawValue {
            return .boolean
        }

        return .scale
    }
}
