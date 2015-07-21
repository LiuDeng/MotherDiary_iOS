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
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func loginClick(sender: UIButton) {
        AVUser.logInWithUsernameInBackground(username.text, password: password.text) { (user, error) -> Void in
            println("username: \(self.username.text) password \(self.password.text)")
            if(error != nil) {
                println("Login failed." + error.description)
            } else {
                println("Login success")
                // 如果登陆成功，则执行segue跳转到MainController
                self.performSegueWithIdentifier("loginSuccess", sender: nil)
            }
        }
    }
    
    // 当键盘上的return键点击时触发
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

