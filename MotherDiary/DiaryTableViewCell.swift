//
//  DiaryTableViewCell.swift
//  MotherDiary
//
//  Created by 赵骁俊 on 15/6/15.
//  Copyright (c) 2015年 赵骁俊. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var diaryTitle: UILabel!
    @IBOutlet weak var diaryContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
