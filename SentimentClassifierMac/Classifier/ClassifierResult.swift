//
//  ClassifierResult.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Cocoa

enum ClassifierResult: Int {
    case undefined
    case positive = 1
    case negative = -1
    
    // MARK: - Public properties -
    
    var description: String {
        switch self {
        case .positive:
            return "POSITIVE"
        case .negative:
            return "NEGATIVE"
        case .undefined:
            return "-"
        }
    }
    
    var image: NSImage? {
        switch self {
        case .positive:
            return NSImage(systemSymbolName: "hand.thumbsup", accessibilityDescription: nil)
        case .negative:
            return NSImage(systemSymbolName: "hand.thumbsdown", accessibilityDescription: nil)
        case .undefined:
            return nil
        }
    }
    
    // MARK: - Initialization -
    
    init(result: String?) {
        
        guard let result = result, let value = Int(result) else {
            self = .undefined
            return
        }
        
        if value != 1 && value != -1 {
            self = .undefined
            return
        }

        self = value == 1 ? .positive : .negative
    }
}
