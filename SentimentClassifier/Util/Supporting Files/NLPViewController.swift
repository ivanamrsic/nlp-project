//
//  NLPViewController.swift
//  nlp
//
//  Created by Ivana Mršić on 19.11.2020..
//

import UIKit
import RxSwift
import RxCocoa

class NLPViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
