//
//  Keyboard.swift
//  KeyboardRiptutorial
//
//  Created by Bill Morrison on 10/2/20.
//
//  derived from https://stackoverflow.com/questions/33474771/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard/33692231#33692231

// https://riptutorial.com/ios/example/16976/create-a-custom-in-app-keyboard


import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
}

class Keyboard: UIView {
    
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: KeyboardDelegate?
    
    // MARK:- keyboard initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// After init'd ... initialize the subview, inputView, and delegate.
    /// - Parameters:
    ///   - textField: textField description
    ///   - delegate: <#delegate description#>
    func initialize(textField: UITextField, delegate: KeyboardDelegate) {
        loadKeyboardNib()
        textField.inputView = self
        self.delegate = delegate
    }
    
    func loadKeyboardNib() {
        let xibFileName = "Keyboard" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    // MARK:- Button actions from .xib file
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.keyWasTapped(character: sender.titleLabel!.text!)
        
    }
}
