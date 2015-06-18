//
//  ViewController.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/12.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginClick(sender: UIButton) {
        BmobUser.loginWithUsernameInBackground(username.text, password: password.text, block: { (user:BmobUser!, error:NSError!) -> Void in
            println("username: \(self.username.text) password \(self.password.text)")
            if(error != nil) {
                println("Login failed." + error.description)
            } else {
                println("Login success")
                self.performSegueWithIdentifier("main", sender: self)
            }
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
        if (nextResponder != nil) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false;
    }
    
    
}

