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
    var diary : Diary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContent.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addPhotoClick(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    // 完成按钮点击
    @IBAction func doneClick(sender: UIBarButtonItem) {
        if (self.diary == nil) {
            // 新建日记
            if (txtTitle.text != nil && txtContent.text != nil) {
                var diary = Diary()
                diary.title = txtTitle.text
                diary.content = txtContent.text
                diary.user = AVUser.currentUser()
                diary.saveInBackgroundWithBlock({ (isSuccess, error) -> Void in
                    if (isSuccess) {
                        println("save success")
                        self.navigationController?.popViewControllerAnimated(true)
                    } else {
                        println("save failed \(error)")
                    }
                })
            }
        } else {
            // 编辑日记
            self.diary?.title = txtTitle.text
            self.diary?.content = txtContent.text
            self.diary?.saveInBackgroundWithBlock({ (isSuccess, error) -> Void in
                if (isSuccess) {
                    println("save success")
                    self.navigationController?.popViewControllerAnimated(true)
                } else {
                    println("save failed \(error)")
                }
            })
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
    
    func updateUI() {
        if (diary != nil) {
            txtTitle.text = diary!.objectForKey(Constants.Diary.title) as? String;
            txtContent.text = diary!.objectForKey(Constants.Diary.content) as? String;
            self.title = "编辑日记"
        } else {
            self.title = "新建日记"
        }
    }
}
