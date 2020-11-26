//
//  LanguagesWireframe.swift
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

final class LanguagesWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard.languages

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: LanguagesViewController.self)
        super.init(viewController: moduleViewController)
        
        moduleViewController.tabBarProperty = .languages

        let interactor = LanguagesInteractor()
        let presenter = LanguagesPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LanguagesWireframe: LanguagesWireframeInterface {
}