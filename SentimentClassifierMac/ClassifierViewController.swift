//
//  ViewController.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 25.11.2020.
//

import Cocoa

class ClassifierViewController: NSViewController {
    
    // MARK: - IBOutlets -

    @IBOutlet private weak var classifierInfoStackView: NSStackView!
    
    @IBOutlet private weak var evaluationLabel: NSTextField!
    @IBOutlet private weak var trainingLabel: NSTextField!
    @IBOutlet private weak var validationLabel: NSTextField!
    
    @IBOutlet private weak var inputTextView: NSTextView!
    @IBOutlet private weak var resultLabel: NSTextField!

    @IBOutlet private weak var progressIndicator: NSProgressIndicator!
    @IBOutlet private weak var classifierCreationDoneImage: NSImageView!
    @IBOutlet private weak var createClassifierButton: NSButton!
    
    @IBOutlet weak var helpLabel: NSTextField!

    // MARK: - Private properties -
    
    private var classifier = Classifier()
    
    // MARK: - Lifecycle methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(with: classifier.accuracy)
//        createClassifierButton.isEnabled = false
        helpLabel.isHidden = true
    }
}

// MARK: - IBActions -

extension ClassifierViewController {
    
    @IBAction func toggleHelpLabelAction(_ sender: Any) {
        helpLabel.isHidden = !helpLabel.isHidden
    }
    
    @IBAction func createClassifierAction(_ sender: NSButton) {
        
        toggleCreateClassifierStatus(creationRunning: true)
                
        DispatchQueue.global(qos: .background).async {
            ClassifierUtil.createClassifier()
            DispatchQueue.main.async {
                self.toggleCreateClassifierStatus(creationRunning: false)
            }
        }
    }
    
    @IBAction func classifyTextAction(_ sender: NSButton) {
        clearResult()
        guard let text = inputTextView.textStorage?.string else { return }
        let result = classifier.classify(text: text)
        resultLabel.stringValue = result.description
    }
}

// MARK: - Private methods -

private extension ClassifierViewController {
    
    func toggleCreateClassifierStatus(creationRunning: Bool) {
        createClassifierButton.isEnabled = !creationRunning
        progressIndicator.isHidden = !creationRunning
        if creationRunning { progressIndicator.startAnimation(nil) }
        classifierCreationDoneImage.isHidden = creationRunning
    }
    
    func updateView(with accuracy: ClassifierAccuracy?) {
        guard let accuracy = accuracy else { return }
        evaluationLabel.stringValue = String(accuracy.evaluation)
        trainingLabel.stringValue = String(accuracy.training)
        validationLabel.stringValue = String(accuracy.validation)
    }
    
    func clearResult() {
        resultLabel.stringValue = ""
    }
}
