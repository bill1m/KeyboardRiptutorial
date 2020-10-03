//
//  ViewController.swift
//  KeyboardRiptutorial
//
//  Created by Bill Morrison on 10/2/20.
//
// https://stackoverflow.com/questions/33474771/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard/33692231#33692231

// https://riptutorial.com/ios/example/16976/create-a-custom-in-app-keyboard



import UIKit

class ViewController: UIViewController, KeyboardDelegate {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize custom keyboard
        let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        keyboardView.delegate = self // the view controller will be notified by the keyboard whenever a key is tapped
        
        // replace system keyboard with custom keyboard
        textField.inputView = keyboardView
    }
    
    // required method for keyboard delegate protocol
    func keyWasTapped(character: String) {
        textField.insertText(character)
    }
    // Do any additional setup after loading the view.
}

