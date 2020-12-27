//
//  UIViewExtensions.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - Reactive -

extension Reactive where Base: UIViewController {

    /// Notifies once that view will appear
    ///
    /// It should mimic viewDidLoad, but as the subscription is done inside viewDidLoad,
    /// the signal of viewDidLoad will not be triggered properly.
    var viewAppearedOnce: Signal<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in () }
        return ControlEvent(events: source)
            .take(1)
            .asSignal(onErrorSignalWith: .empty())
    }

    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in () }
        return ControlEvent(events: source)
    }

    var viewDidAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidAppear(_:))).map { _ in () }
        return ControlEvent(events: source)
    }

    var viewWillDisappear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillDisappear(_:))).map { _ in () }
        return ControlEvent(events: source)
    }

    var viewDidLayoutSubviews: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in () }
        return ControlEvent(events: source)
    }

}
