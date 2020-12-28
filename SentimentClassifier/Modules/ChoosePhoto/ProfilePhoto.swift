//
//  ProfilePhoto.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

struct ProfilePhoto: Codable {
    let title: String
    let imageName: String

    private init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }

    static var caveman: ProfilePhoto {
        ProfilePhoto(title: Strings.cavemanPhoto, imageName: Profile.caveman)
    }

    static var trash: ProfilePhoto {
        ProfilePhoto(title: Strings.trashPhoto, imageName: Profile.trash)
    }

    static var chinchilla: ProfilePhoto {
        ProfilePhoto(title: Strings.chinchillaPhoto, imageName: Profile.chinchilla)
    }

    static var edvardMunch: ProfilePhoto {
        ProfilePhoto(title: Strings.edvardMunchPhoto, imageName: Profile.edvardMunch)
    }

    static var iceCream: ProfilePhoto {
        ProfilePhoto(title: Strings.iceCreamPhoto, imageName: Profile.iceCream)
    }

    struct Profile {
        static var caveman: String { "Profile/caveman" }
        static var trash: String { "Profile/trash" }
        static var chinchilla: String { "Profile/chinchilla" }
        static var edvardMunch: String { "Profile/edvard-munch" }
        static var iceCream: String { "Profile/ice-cream" }
    }

    static var allPhotos: [ProfilePhoto] {
        return [
            .caveman, .trash, .chinchilla, .edvardMunch, .iceCream
        ]
    }
}
