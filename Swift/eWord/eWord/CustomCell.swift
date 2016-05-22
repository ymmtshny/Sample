//
//  CustomCell.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/18.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var jpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
