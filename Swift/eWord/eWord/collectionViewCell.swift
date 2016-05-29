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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setDateLabelWith(int :Int) {
            dateLabel.text = "\(int)"
    }
}
