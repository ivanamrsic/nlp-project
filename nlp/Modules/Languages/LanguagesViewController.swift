//
//  LanguagesViewController.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class LanguagesViewController: NLPViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Public properties -

    var presenter: LanguagesPresenterInterface!

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Extensions -

extension LanguagesViewController: LanguagesViewInterface {
}

private extension LanguagesViewController {

    func setupView() {
        let output = Languages.ViewOutput(
            inputText: inputTextView.rx.text.asDriver()
        )

        let input = presenter.configure(with: output)
        
        input.result.drive(resultLabel.rx.text).disposed(by: disposeBag)
    }

}