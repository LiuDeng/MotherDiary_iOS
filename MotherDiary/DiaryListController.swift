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
        var query = Diary.query()
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock  { (array, error) -> Void in
            for obj in array{
                if obj is Diary {
                    self.diarys.append(obj as! Diary)
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
        
        cell.diaryTitle.text = diarys[indexPath.row].objectForKey(Constants.Diary.title) as? String
        cell.diaryContent.text = diarys[indexPath.row].objectForKey(Constants.Diary.content) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let diary = diarys[indexPath.row]
        performSegueWithIdentifier("showDiaryDetail", sender: diary);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showDiaryDetail":
                // 如果segue的目标viewController是新建日记的话，传递一个日记对象
                if let dvc = segue.destinationViewController as? AddDiaryController {
                    dvc.diary = sender as? Diary
                }
            default: break
            }
        }
    }
    
}