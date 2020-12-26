//
//  Review.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import Foundation

struct Review: Decodable {
    let movie: String
    let title: String
    let date: String
    let text: String
}
