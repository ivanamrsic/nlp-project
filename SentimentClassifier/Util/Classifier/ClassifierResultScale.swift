//
//  ClassifierResultScale.swift
//  SentimentClassifierMac
//
//  Created by Ivana Mršić on 17.12.2020..
//

import Foundation

enum ClassifierResultScale: Int {
    case undefined
    case extremlySatisfied = 5
    case satisfied = 4
    case neutral = 3
    case unsatisified = 2
    case extremlyUnsatisifed = 1
    
    // MARK: - Public properties -
    
    var description: String {
        switch self {
        case .extremlySatisfied:
            return "EXTREMLY SATISFIED 😁 (5)"
        case .satisfied:
            return "SATISFIED 😀 (4)"
        case .neutral:
            return "NEUTRAL 😐 (3)"
        case .unsatisified:
            return "UNSATISFIED 😟 (2)"
        case .extremlyUnsatisifed:
            return "EXTREMLY UNSATISFIED 😡 (1)"
        case .undefined:
            return "-"
        }
    }
    
    // MARK: - Initialization -
    
    init(result: String?) {
        
        guard let result = result, let value = Int(result) else {
            self = .undefined
            return
        }
        
        if value < 1 && value > 5 {
            self = .undefined
            return
        }

        if value == 1 {
            self = .extremlyUnsatisifed
        } else if value == 2 {
            self = .unsatisified
        } else if value == 3 {
            self = .neutral
        } else if value == 4 {
            self = .satisfied
        } else {
            self = .extremlySatisfied
        }
    }
}

