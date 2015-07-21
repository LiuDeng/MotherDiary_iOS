//
//  RegisterController.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/7/16.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//


class RegisterController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func registerClick(sender: UIButton) {
        var user = AVUser()
        user.username = self.username.text
        user.password = self.password.text
        
        user.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
            if (succeeded) {
                println("注册成功")
            } else {
                
            }
        }
    }
}
