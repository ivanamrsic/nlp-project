//
//  StringExtensions.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 02.01.2021..
//

import Foundation

extension Optional where Wrapped == String {

    var orEmptyValue: String {
        guard let value = self else { return Constants.emptyValue }
        return value.count > 0 ? value : Constants.emptyValue
    }

    var isEmptyOrNil: Bool {
        guard let value = self else { return true }
        return value.count == 0
    }
}
