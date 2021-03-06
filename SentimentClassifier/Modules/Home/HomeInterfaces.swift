//
//  HomeInterfaces.swift
//  nlp
//
//  Created by Ivana Mršić on 18.11.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeWireframeInterface: WireframeInterface {
    var childViewControllers: [NLPNavigationController] { get }
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
    func configure(with output: Home.ViewOutput) -> Home.ViewInput
}

protocol HomeInteractorInterface: InteractorInterface {
}

enum Home {

    struct ViewOutput {
    }

    struct ViewInput {
        let tabBars: Driver<[NLPNavigationController]>
    }

}
