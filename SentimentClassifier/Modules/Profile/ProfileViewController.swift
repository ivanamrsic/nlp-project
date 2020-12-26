//
//  ProfileViewController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ProfileViewController: NLPViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var choosePhotoButton: UIButton!

    @IBOutlet private weak var usernameTitleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!

    @IBOutlet private weak var emailTitleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!

    @IBOutlet private weak var ratingsCountTitleLabel: UILabel!
    @IBOutlet private weak var ratingsCountLabel: UILabel!

    @IBOutlet private weak var ratingsSectionLabel: UILabel!
    @IBOutlet private weak var createReviewButton: UIButton!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(cellOfType: ReviewTableViewCell.self)
        }
    }
    
    // MARK: - Public properties

    var presenter: ProfilePresenterInterface!

    // MARK: - Private properties

    private lazy var dataSourceDelegate: TableDataSourceDelegate = {
        return TableDataSourceDelegate(tableView: self.tableView)
    }()

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupUI()
    }
}

// MARK: - Extensions -

extension ProfileViewController: ProfileViewInterface {
}

private extension ProfileViewController {

    func configure() {

        let output = Profile.ViewOutput(
            choosePhotoAction: choosePhotoButton.rx.tap.asSignal(),
            createReviewAction: createReviewButton.rx.tap.asSignal()
        )

        let input = presenter.configure(with: output)

        handle(items: input.items)
        handle(image: input.image)
        handle(reviewCount: input.reviewCount)
    }

}

private extension ProfileViewController {

    func setupUI() {
        usernameTitleLabel.text = Strings.usernameTitle
        emailTitleLabel.text = Strings.emailTitle
        ratingsCountTitleLabel.text = Strings.ratingsCountTitle
        ratingsSectionLabel.text = Strings.ratingsTitle
    }
}

private extension ProfileViewController {

    func handle(items: Driver<[TableCellItem]>) {
        items
            .drive(dataSourceDelegate.rx.items)
            .disposed(by: disposeBag)
    }

    func handle(image: Driver<String?>) {
        image.drive(onNext: { [unowned choosePhotoButton] in
            guard let imageName = $0 else { return }
            let image = UIImage(named: imageName)?
                    .withRenderingMode(.alwaysOriginal)

                choosePhotoButton?.setImage(image, for: .normal)
            })
            .disposed(by: disposeBag)
    }

    func handle(reviewCount: Driver<Int>) {
        reviewCount
            .map { String($0) }
            .drive(ratingsCountLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
