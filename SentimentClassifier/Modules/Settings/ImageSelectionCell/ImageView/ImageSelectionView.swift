//
//  ImageSelectionView.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class ImageSelectionView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var imageOption: UIImageView!
    @IBOutlet private weak var contentView: UIView!

    // MARK: - Private properties

    private let disposeBag = DisposeBag()
}

extension ImageSelectionView {

    func configure(with image: UIImage?, isSelected: Driver<Bool>, setSelected: @escaping (() -> Void)) {

        imageOption.image = image

        isSelected
            .drive(onNext: { [unowned self] in
                self.setSelectedUI(selected: $0)
            })
            .disposed(by: disposeBag)

        contentView.rx.tapGesture()
            .skip(1)
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { _ in setSelected() })
            .disposed(by: disposeBag)
    }

    func setSelectedUI(selected: Bool) {
        contentView.layer.cornerRadius = 40;
        contentView.layer.masksToBounds = true;
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = selected ? UIColor.blue.cgColor : UIColor.clear.cgColor
    }
}
