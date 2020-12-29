//
//  ImageSelectionCellItem.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

struct ImageSelectionCellItem {

    // MARK: - Public properties

    let photos: [ProfilePhoto]

    // MARK: - Private properties

    private let selectedPhoto: BehaviorRelay<ProfilePhoto>

    // MARK: - Init

    init(photos: [ProfilePhoto], selectedPhoto: ProfilePhoto) {
        self.photos = photos
        self.selectedPhoto = BehaviorRelay<ProfilePhoto>(value: selectedPhoto)
    }
}

extension ImageSelectionCellItem: TableCellItem {

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ImageSelectionTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    var estimatedHeight: CGFloat {
        return height
    }

    var height: CGFloat {
        return 130
    }
}

extension ImageSelectionCellItem {

    var photoViews: [UIView] {
        return photos.map { return self.createImageSelectionView(with: $0) }
    }

    var selectedValue: Driver<ProfilePhoto> {
        return selectedPhoto.asDriver()
    }
}

// MARK: - View creation

private extension ImageSelectionCellItem {

    func createImageSelectionView(with photo: ProfilePhoto) -> UIView {
        return loadView(
            image: photo.image,
            isSelected: selectedValue.map { $0.name == photo.name },
            setSelected: { [unowned selectedPhoto] in selectedPhoto.accept(photo) }
        )
    }

    func loadView(image: UIImage, isSelected: Driver<Bool>, setSelected: @escaping (() -> Void)) -> UIView {
        let view = Bundle.main.load(viewOfType: ImageSelectionView.self)
        view.configure(with: image, isSelected: isSelected, setSelected: setSelected)
        view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return view
    }
}
