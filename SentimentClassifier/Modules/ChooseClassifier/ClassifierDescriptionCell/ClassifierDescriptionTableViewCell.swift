//
//  ClassifierDescriptionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 29.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

class ClassifierDescriptionTableViewCell: UITableViewCell {

    @IBOutlet private weak var classifierNameLabel: UILabel!
    @IBOutlet private weak var radioButton: UIButton!

    var selectedRadioButton = true

    private var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - Configuration

extension ClassifierDescriptionTableViewCell {

    func configure(with item: ClassifierDescriptionCellItem) {
        classifierNameLabel.text = item.title
        handleButtonTap()
    }
}

extension ClassifierDescriptionTableViewCell {

    func handleButtonTap() {
        radioButton.rx.tap
            .asDriver()
            .drive(onNext: { [unowned self, unowned radioButton] in

                let image = self.selectedRadioButton ? UIImage(systemName: "record.circle") : UIImage(systemName: "circle")

                radioButton?.setImage(image, for: .normal)
                self.selectedRadioButton = !self.selectedRadioButton
            })
            .disposed(by: disposeBag)
    }
}
