//
//  LanguageSelectionTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 27.12.2020..
//

import UIKit
import RxSwift
import RxCocoa

final class LanguageSelectionTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var flagImageView: UIImageView!

    // MARK: - Private properties

    private lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(
            title: Strings.done,
            style: .done,
            target: self,
            action: nil
        )
    }()

    private var item: LanguageSelectionCellItem?

    private var disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.inputAccessoryView = toolbar
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

// MARK: - Configuration

extension LanguageSelectionTableViewCell {

    func configure(with item: LanguageSelectionCellItem) {
        self.item = item
        setupUI(with: item)
        setupPickerView()
        handle(selectedCell: item.selectedDriver)
        handle(done: doneButton.rx.tap.asSignal())
    }
}

// MARK: - Binding Setup

private extension LanguageSelectionTableViewCell {

    func handle(selectedCell: Driver<Void>) {
        selectedCell
            .skip(1)
            .drive(onNext: { [unowned textField] in
                textField?.becomeFirstResponder()
            })
            .disposed(by: disposeBag)
    }

    func handle(itemSelected: Driver<(row: Int, component: Int)>) {
        itemSelected
            .map { [unowned self] in self.item?.options[$0.row] }
            .drive(onNext: { [unowned self] in
                self.textField.text = $0?.rawValue
                self.flagImageView.image = $0?.image
            })
            .disposed(by: disposeBag)
    }

    func handle(done: Signal<Void>) {
        done
            .emit(onNext: { [unowned textField, unowned self] in
                textField?.resignFirstResponder()
                guard let language = textField?.text else { return }
                self.item?.set(language: Language.get(from: language))
            })
            .disposed(by: disposeBag)
    }

    func handleItems(for pickerView: UIPickerView) {
        Driver.just(item?.options)
            .compactMap { $0 }
            .drive(pickerView.rx.itemTitles) { (_, item) in return item.rawValue }
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup

private extension LanguageSelectionTableViewCell {

    func setupUI(with item: LanguageSelectionCellItem) {
        textField.text = item.language.rawValue
        flagImageView.image = item.language.image
    }

    func setupPickerView() {
        let pickerView = createPickerView()
        textField.inputView = pickerView
        handle(itemSelected: pickerView.rx.itemSelected.asDriver())
    }
}

// MARK: - View Creation

private extension LanguageSelectionTableViewCell {

    var toolbar: UIToolbar {

        let toolBar = UIToolbar()

        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        return toolBar
    }

    func createPickerView() -> UIPickerView {

        let pickerView = UIPickerView()

        handleItems(for: pickerView)

        if let selected = item?.language,
           let selectedIndex = item?.options.firstIndex(of: selected) {
            pickerView.selectRow(selectedIndex, inComponent: 0, animated: true)
        } else {
            pickerView.selectRow(0, inComponent: 0, animated: true)
        }

        return pickerView
    }
}
