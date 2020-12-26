//
//  ProfileWireframe.swift
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

final class ProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard.profile

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ProfileViewController.self)
        super.init(viewController: moduleViewController)

        moduleViewController.tabBarProperty = .profile
        
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ProfileWireframe: ProfileWireframeInterface {

    func openChoosePhoto() {
        navigationController?.presentWireframe(ChoosePhotoWireframe())
    }

}
