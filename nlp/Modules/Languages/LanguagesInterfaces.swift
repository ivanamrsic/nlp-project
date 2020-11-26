//
//  LanguagesInterfaces.swift
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

protocol LanguagesWireframeInterface: WireframeInterface {
}

protocol LanguagesViewInterface: ViewInterface {
}

protocol LanguagesPresenterInterface: PresenterInterface {
    func configure(with output: Languages.ViewOutput) -> Languages.ViewInput
}

protocol LanguagesInteractorInterface: InteractorInterface {
}

enum Languages {

    struct ViewOutput {
        let inputText: Driver<String?>
    }

    struct ViewInput {
        let result: Driver<String>
    }

}
