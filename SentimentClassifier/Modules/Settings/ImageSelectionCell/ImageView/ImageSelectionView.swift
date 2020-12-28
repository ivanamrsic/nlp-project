//
//  ImageSelectionView.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit

class ImageSelectionView: UIView {

    @IBOutlet private weak var imageOption: UIImageView!


}

extension ImageSelectionView {

    func configure(with image: UIImage?) {
        imageOption.image = image
    }
}
