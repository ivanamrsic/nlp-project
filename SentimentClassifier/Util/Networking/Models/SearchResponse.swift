//
//  SearchResponse.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import Foundation

struct SearchResponse: Decodable {
    let search: [Movie]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }

    struct Movie: Decodable {
        let title: String
        let year: String
        let imdbID: String
        let type: String
        let poster: String

        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID
            case type = "Type"
            case poster = "Poster"
        }
    }
}
