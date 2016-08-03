//
//  ViewController.swift
//  UITextFieldDelegationTest
//
//  Created by Bogdan Melnik on 7/6/16.
//  Copyright © 2016 Yohoho. All rights reserved.
//

import UIKit

//    Delegate
//    ||
//    \/
class ViewController: UIViewController, UITextFieldDelegate /* <= Protocol*/ {
    
    @IBOutlet weak var textField: UITextField! // <= Delegator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
/*
        // NOTE: These ranges are still just a subset of all the emoji characters;
        //       they seem to be all over the place...
        
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        
        for range in emojiRanges {
            for i in range {
                let c = String(UnicodeScalar(i))
                print(c, terminator: "")
            }
        }
 */
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("Text editing is about to begin!")
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // became first responder
        print("Text editing bedins!")
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("Text editing is about to end!")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("Text editing ends!")

    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("Text edited!")
        if (((textField.text?.characters.count)! + string.characters.count) % 3 == 0) && (string != ""){
            textField.text! = textField.text! + "🚀"
            return false
        }
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("Clear button pressed!")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool  {
        // called when 'return' key pressed. return NO to ignore.
        print("Return button pressed!")
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

