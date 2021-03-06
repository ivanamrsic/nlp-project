//
//  ClassifierViewController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 17.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ClassifierViewController: NLPViewController {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!

    @IBOutlet private weak var inputTextView: UITextView!

    @IBOutlet private weak var classifyButton: UIButton!

    @IBOutlet private weak var resultsTitleLabel: UILabel!
    @IBOutlet private weak var resultsValueLabel: UILabel!

    // MARK: - Public properties

    var presenter: ClassifierPresenterInterface!

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
}

// MARK: - ClassifierViewInterface

extension ClassifierViewController: ClassifierViewInterface {
}

// MARK: - Configuration

private extension ClassifierViewController {

    func setupView() {

        let output = Classifier.ViewOutput(
            classifyAction: classifyAction
        )

        let input = presenter.configure(with: output)
        handle(result: input.result)
    }
}

// MARK: - Binding Setup

private extension ClassifierViewController {

    var classifyAction: Signal<String?> {

        let inputText = inputTextView.rx.text
            .asSignal(onErrorSignalWith: .empty())

        return classifyButton.rx.tap.asSignal()
            .withLatestFrom(inputText) { $1 }
    }

    func handle(result: Driver<String?>) {
        result
            .drive(resultsValueLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup

private extension ClassifierViewController {

    func setupUI() {
        titleLabel.text = Strings.classifierScreenTitle
        infoLabel.text = Strings.classifierInfo
        classifyButton.setDefaultCornerRadius()
        classifyButton.setTitle(Strings.classify, for: .normal)
        resultsTitleLabel.text = Strings.result
        resultsValueLabel.text = Constants.emptyValue
    }
}
