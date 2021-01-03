//
//  ProfilePhoto.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

enum ProfilePhoto {
    case trash
    case picture
    case puzzle
    case sun
    case male
    case female

    var id: Int {
        switch self {
        case .trash: return 1
        case .picture: return 2
        case .puzzle: return 3
        case .sun: return 4
        case .male: return 5
        case .female: return 6
        }
    }

    var name: String {
        switch self {
        case .trash: return Strings.trashPhoto
        case .picture: return Strings.picturePhoto
        case .puzzle: return Strings.puzzlePhoto
        case .sun: return Strings.sunPhoto
        case .male: return Strings.malePhoto
        case .female: return Strings.femalePhoto
        }
    }

    var image: UIImage {
        switch self {
        case .trash: return UIImage(named: "Profile/trash")!
        case .picture: return UIImage(named: "Profile/picture")!
        case .puzzle: return UIImage(named: "Profile/puzzle")!
        case .sun: return UIImage(named: "Profile/sun")!
        case .male: return UIImage(named: "Profile/male")!
        case .female: return UIImage(named: "Profile/female")!
        }
    }

    static func get(from id: Int?) -> ProfilePhoto {
        guard let id = id else { return .picture }
        if id == ProfilePhoto.trash.id { return .trash }
        else if id == ProfilePhoto.picture.id { return .picture }
        else if id == ProfilePhoto.puzzle.id { return .puzzle }
        else if id == ProfilePhoto.sun.id { return .sun }
        else if id == ProfilePhoto.male.id { return .male }
        else if id == ProfilePhoto.female.id { return .female }
        return .picture
    }

    static var allPhotos: [ProfilePhoto] {
        return [
            .trash, .picture, .puzzle, .sun, .male, .female
        ]
    }
}
