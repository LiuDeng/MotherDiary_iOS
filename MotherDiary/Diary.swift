//
//  Diary.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/12.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import Foundation

class Diary : AVObject, AVSubclassing {
    
    /// 标题
    @NSManaged var title : String?
    
    /// 正文
    @NSManaged var content : String?
    
    /// 图片
    @NSManaged var pic : String?
    
    /// 属于的用户
    @NSManaged var user : AVUser?
    
    static func parseClassName() -> String! {
        return "Diary"
    }
    
    override init() {
        super.init();
    }
    
}