//
//  AddDiaryController.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/17.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import UIKit

class AddDiaryController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtContent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContent.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addDiaryClick(sender: UIButton) {
        if (txtTitle.text != nil && txtContent.text != nil) {
            var diary = Diary()
            diary.title = txtTitle.text
            diary.content = txtTitle.text
            diary.user = BmobUser.getCurrentUser()
            
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
