//
//  MainController.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/15.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import UIKit

class DiaryListController: UITableViewController {
    
    var diarys : Array<Diary> = []
    
    @IBAction func addClick(sender: UIBarButtonItem) {
        println("Add click")
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.diarys.removeAll(keepCapacity: false)
        var user = BmobUser.getCurrentUser()
        var bquery : BmobQuery = BmobQuery(className: "Diary")
        bquery.whereKey("user", equalTo: user)
        bquery.findObjectsInBackgroundWithBlock { (array, error) -> Void in
            for obj in array{
                if obj is BmobObject {
                    var diary = Diary();
                    diary.title = obj.objectForKey("title") as? String
                    diary.content = obj.objectForKey("content") as? String
                    self.diarys.append(diary)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diarys.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("diaryCell") as! DiaryTableViewCell
        
        cell.diaryTitle.text = diarys[indexPath.row].title
        cell.diaryContent.text = diarys[indexPath.row].content
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}