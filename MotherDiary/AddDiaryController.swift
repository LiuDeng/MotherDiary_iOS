//
//  AddDiaryController.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/17.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import UIKit

class AddDiaryController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtContent: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContent.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addPhotoClick(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    // 完成按钮点击
    @IBAction func doneClick(sender: UIBarButtonItem) {
        if (txtTitle.text != nil && txtContent.text != nil) {
            var diary:BmobObject = BmobObject(className: "Diary")
            diary.setObject(txtTitle.text, forKey: "title")
            diary.setObject(txtContent.text, forKey: "content")
            diary.setObject(BmobUser.getCurrentUser(), forKey: "user")
            diary.saveInBackgroundWithResultBlock({ isSuccess, error -> Void in
                if (isSuccess) {
                    println("save success")
                    self.navigationController?.popViewControllerAnimated(true)
                } else {
                    println("save failed")
                }
            });
        }
    }
    
    // 处理TextField的返回的点击事件
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
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imgPhoto.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
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
