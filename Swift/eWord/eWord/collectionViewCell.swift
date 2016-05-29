//
//  collectionViewCell.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/26.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel(frame: CGRectMake(0, 0, 50, 50))
        label.center = CGPointMake(25, 25)
        label.textAlignment = NSTextAlignment.Center
        label.text = "I'am a test label"
        dateLabel = label
        self.addSubview(dateLabel)
        
    }
}

