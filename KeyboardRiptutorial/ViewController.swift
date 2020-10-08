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
        
        // Custom Keyboard
        let keyboard = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 150))
        // Note: the textField holds a reference
        keyboard.loadKeyboardNib(textField: textField, delegate: self)
    }
    
    // Keyboard delegate method
    func keyWasTapped(character: String) {
        switch character {
            case "⏎":
                textField.resignFirstResponder()
            default:
                textField.insertText(character)
        }
    }
}

