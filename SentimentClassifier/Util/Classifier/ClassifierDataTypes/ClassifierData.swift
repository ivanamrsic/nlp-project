//
//  ClassifierInfo.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import Foundation

struct ClassifierInfo {
    let name: String
    let type: ClassifierModelType
    let dataInfo: DataInfo
    let accuracy: ClassifierAccuracy?
    let labels: [String]
}

struct DataInfo {
    let dataName: String
    let dataPointsCount: Int
    let trainingPercentage: Int
    let testingPercentage: Int
    let dataLink: String
    let authors: Author?
}

struct Author {
    let author: String
    let title: String
    let bookTitle: String
    let month: Int
    let year: Int
    let address: String
    let publisher: String
    let pages: String
    let url: String
}
