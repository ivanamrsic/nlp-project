//
//  ProfilePhoto.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

enum ProfilePhoto {
    case caveman
    case trash
    case chinchilla
    case edvardMunch
    case iceCream

    var id: Int {
        switch self {
        case .caveman: return 1
        case .trash: return 2
        case .chinchilla: return 3
        case .edvardMunch: return 4
        case .iceCream: return 5
        }
    }

    var name: String {
        switch self {
        case .caveman: return Strings.cavemanPhoto
        case .trash: return Strings.trashPhoto
        case .chinchilla: return Strings.chinchillaPhoto
        case .edvardMunch: return Strings.edvardMunchPhoto
        case .iceCream: return Strings.iceCreamPhoto
        }
    }

    var image: UIImage {
        switch self {
        case .caveman: return UIImage(named: "Profile/caveman")!
        case .trash: return UIImage(named: "Profile/trash")!
        case .chinchilla: return UIImage(named: "Profile/chinchilla")!
        case .edvardMunch: return UIImage(named: "Profile/edvard-munch")!
        case .iceCream: return UIImage(named: "Profile/ice-cream")!
        }
    }

    static func get(from id: Int?) -> ProfilePhoto {
        guard let id = id else { return .caveman }
        if id == ProfilePhoto.caveman.id { return .caveman }
        else if id == ProfilePhoto.trash.id { return .trash }
        else if id == ProfilePhoto.chinchilla.id { return .chinchilla }
        else if id == ProfilePhoto.edvardMunch.id { return .edvardMunch }
        else if id == ProfilePhoto.iceCream.id { return .iceCream }
        return .caveman
    }

    static var allPhotos: [ProfilePhoto] {
        return [
            .caveman, .trash, .chinchilla, .edvardMunch, .iceCream
        ]
    }
}
