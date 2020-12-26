//
//  ProfilePresenter.swift
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

final class ProfilePresenter {

    // MARK: - Private properties -

    private unowned let view: ProfileViewInterface
    private let interactor: ProfileInteractorInterface
    private let wireframe: ProfileWireframeInterface

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    init(view: ProfileViewInterface, interactor: ProfileInteractorInterface, wireframe: ProfileWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ProfilePresenter: ProfilePresenterInterface {

    func configure(with output: Profile.ViewOutput) -> Profile.ViewInput {
        handle(choosePhoto: output.choosePhotoAction)
        handle(createReview: output.createReviewAction)

        let items = createItems()

        return Profile.ViewInput(
            items: .just(items),
            image: interactor.profilePhoto,
            reviewCount: .just(items.count)
        )
    }

}

private extension ProfilePresenter {

    func handle(choosePhoto: Signal<Void>) {
        choosePhoto.emit(onNext: { [unowned wireframe] in wireframe.openChoosePhoto() })
            .disposed(by: disposeBag)
    }

    func handle(createReview: Signal<Void>) {
        createReview.emit(onNext: { [unowned wireframe] in wireframe.openCreateReview() })
            .disposed(by: disposeBag)
    }
}

private extension ProfilePresenter {

    func createItems() -> [TableCellItem] {

        let text1 = "Really enjoyed this series. One reviewer gave a low rating mentioning how the first episode showed her using pills in the orphanage....yes they had to as it shapes the rest of her future. The characters are great and the acting on is superb. Kept me hooked!"

        let text2 = "I will not write much. This is one of the best 5 series I have ever watched and I have seen a lot! It is very under-rated in my opinion. Just for reference I consider no.1 The Wire."

        let text3 = "If I saw the movie now for the first time I know I probably will hate it, but the 11 year old me was so love struck with it. Honestly no movie these days makes me this happy anymore. Also I think this one (the first movie) is so much cinematically pleasing. I enjoy the dark blue rainy vibe & the shaky camera a lot. This movie is my guilty pleasure. 10 for the nostalgia feelings."

        let text4 = "Christmas favourite, every year! Good acting, storyline, funny and heart warming."

        let r1 = Review(movie: "The Queen's Gambit (2020)", title: "Well done!", date: "25 October 2020", text: text1)

        let r2 = Review(movie: "Line of Duty (2012- )", title: "Absolutely stunning!", date: "26 October 2020", text: text2)

        let r3 = Review(movie: "Twilight (2008)", title: "Guilty pleasure", date: "7 August 2018", text: text3)

        let r4 = Review(movie: "Home Alone (1990)", title: "Classic!", date: "7 May 2017", text: text4)

        return [
            ReviewTableCellItem(review: r1, reviewScore: ClassifierModel().classify(text: text1).description),
            ReviewTableCellItem(review: r2, reviewScore: ClassifierModel().classify(text: text2).description),
            ReviewTableCellItem(review: r3, reviewScore: ClassifierModel().classify(text: text3).description),
            ReviewTableCellItem(review: r4, reviewScore: ClassifierModel().classify(text: text4).description)
        ]
    }
}
