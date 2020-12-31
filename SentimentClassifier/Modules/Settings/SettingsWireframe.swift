//
//  SettingsWireframe.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class SettingsWireframe: BaseWireframe {

    // MARK: - Private properties

    private let storyboard = UIStoryboard.settings

    // MARK: - Module setup

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: SettingsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - SettingsWireframeInterface

extension SettingsWireframe: SettingsWireframeInterface {

    func openEditPersonalInfo() {
        navigationController?.pushWireframe(EditPersonalInfoWireframe())
    }

    func openChooseClassifier() {
        navigationController?.pushWireframe(ChooseClassifierWireframe())
    }
}
