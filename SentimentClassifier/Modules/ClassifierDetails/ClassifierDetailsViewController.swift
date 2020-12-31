//
//  ClassifierDetailsViewController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 30.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ClassifierDetailsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // Data

    @IBOutlet private weak var dataView: UIView!
    @IBOutlet private var dataInfoViews: [UIView]!
    @IBOutlet private weak var dataTitleLabel: UILabel!

    @IBOutlet private weak var dataNameTitleLabel: UILabel!
    @IBOutlet private weak var dataNameValueLabel: UILabel!

    @IBOutlet private weak var dataPointsCountTitleLabel: UILabel!
    @IBOutlet private weak var dataPointsCountValueLabel: UILabel!

    @IBOutlet private weak var trainingPercentageTitleLabel: UILabel!
    @IBOutlet private weak var trainingPercentageValueLabel: UILabel!
    
    @IBOutlet private weak var testingPercentageValueLabel: UILabel!
    @IBOutlet private weak var testingPercentageTitleLabel: UILabel!

    @IBOutlet private weak var dataLinkButton: UIButton!

    // Accuracy

    @IBOutlet private weak var accuracyView: UIView!
    @IBOutlet private weak var accuracyTitleLabel: UILabel!

    @IBOutlet private weak var evaluationValueLabel: UILabel!
    @IBOutlet private weak var evaluationTitleLabel: UILabel!

    @IBOutlet private weak var trainingView: UIView!
    @IBOutlet private weak var trainingValueLabel: UILabel!
    @IBOutlet private weak var trainingTitleLabel: UILabel!

    @IBOutlet private weak var validationValueLabel: UILabel!
    @IBOutlet private weak var validationTitleLabel: UILabel!
    
    // MARK: - Public properties

    var presenter: ClassifierDetailsPresenterInterface!

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupUI()
    }
}

// MARK: - ClassifierDetailsViewInterface

extension ClassifierDetailsViewController: ClassifierDetailsViewInterface {
}

// MARK: - Configuration

private extension ClassifierDetailsViewController {

    func configure() {
        let output = ClassifierDetails.ViewOutput(
            openLinkAction: dataLinkButton.rx.tap.asSignal()
        )

        _ = presenter.configure(with: output)
    }

}

// MARK: - UI Setup

private extension ClassifierDetailsViewController {

    func setupUI() {
        titleLabel.text = presenter.data.name
        setupAccuracyUI()
        setupDataUI()
    }

    func setupAccuracyUI() {
        guard let accuracy = presenter.data.accuracy else { return }

        setupShadow(on: accuracyView)

        trainingView.addLeftBorder(with: UIColor.lightGray, andWidth: 1)
        trainingView.addRightBorder(with: UIColor.lightGray, andWidth: 1)

        accuracyTitleLabel.text = Strings.accuracy
        evaluationValueLabel.text = String(format: "%.2f", accuracy.evaluation)
        evaluationTitleLabel.text = Strings.evaluation
        trainingValueLabel.text = String(format: "%.2f", accuracy.training)
        trainingTitleLabel.text = Strings.training
        validationValueLabel.text = String(format: "%.2f", accuracy.validation)
        validationTitleLabel.text = Strings.validation
    }

    func setupDataUI() {
        let dataInfo = presenter.data.dataInfo
        setupShadow(on: dataView)
        dataInfoViews.forEach { $0.addBottomBorder(with: UIColor.lightGray, andWidth: 1) }
        dataTitleLabel.text = Strings.data
        dataNameTitleLabel.text = Strings.dataName
        dataNameValueLabel.text = dataInfo.dataName
        dataPointsCountTitleLabel.text = Strings.dataPointsCount
        dataPointsCountValueLabel.text = String(dataInfo.dataPointsCount)
        trainingPercentageTitleLabel.text = Strings.dataTrainingPercentage
        trainingPercentageValueLabel.text = String(dataInfo.trainingPercentage)
        testingPercentageTitleLabel.text = Strings.dataTestingPercentage
        testingPercentageValueLabel.text = String(dataInfo.testingPercentage)


        let buttonAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.NLP.secondary,
            .underlineStyle: NSUnderlineStyle.single.rawValue]

        let buttonTitle = NSMutableAttributedString(
            string: Strings.moreDetails,
            attributes: buttonAttributes
        )

        dataLinkButton.setAttributedTitle(buttonTitle, for: .normal)
    }

    func setupShadow(on view: UIView) {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 2
    }
}
