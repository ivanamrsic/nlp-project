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
    let reviewScore: String

    private static let text1 = "Really enjoyed this series. One reviewer gave a low rating mentioning how the first episode showed her using pills in the orphanage....yes they had to as it shapes the rest of her future. The characters are great and the acting on is superb. Kept me hooked!"

    private static let text2 = "I will not write much. This is one of the best 5 series I have ever watched and I have seen a lot! It is very under-rated in my opinion. Just for reference I consider no.1 The Wire."

    private static let text3 = "If I saw the movie now for the first time I know I probably will hate it, but the 11 year old me was so love struck with it. Honestly no movie these days makes me this happy anymore. Also I think this one (the first movie) is so much cinematically pleasing. I enjoy the dark blue rainy vibe & the shaky camera a lot. This movie is my guilty pleasure. 10 for the nostalgia feelings."

    private static let text4 = "Christmas favourite, every year! Good acting, storyline, funny and heart warming."

    static let r1 = Review(movie: "The Queen's Gambit (2020)", title: "Well done!", date: "25 October 2020", text: text1, reviewScore: ClassifierModel().classify(text: text1).description)

    static let r2 = Review(movie: "Line of Duty (2012- )", title: "Absolutely stunning!", date: "26 October 2020", text: text2, reviewScore: ClassifierModel().classify(text: text2).description)

    static let r3 = Review(movie: "Twilight (2008)", title: "Guilty pleasure", date: "7 August 2018", text: text3, reviewScore: ClassifierModel().classify(text: text3).description)

    static let r4 = Review(movie: "Home Alone (1990)", title: "Classic!", date: "7 May 2017", text: text4, reviewScore: ClassifierModel().classify(text: text4).description)
}
