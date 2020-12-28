//
//  ImageSelectionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit

class ImageSelectionTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ImageSelectionTableViewCell {

    func configure(with item: ImageSelectionCellItem) {
        ProfilePhoto.allPhotos.forEach { [unowned stackView] in
            stackView?.addArrangedSubview(createView(photoName: $0.imageName))
        }
    }

    func createView(photoName: String) -> UIView {
        let view = Bundle.main.load(viewOfType: ImageSelectionView.self)
        view.configure(with: UIImage(named: photoName))
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }
}
