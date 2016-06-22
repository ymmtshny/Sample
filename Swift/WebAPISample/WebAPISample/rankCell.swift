//
//  rankCell.swift
//  WebAPISample
//
//  Created by Shinya Yamamoto on 2016/06/20.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class rankCell : UITableViewCell {
    
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopPoint: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func setRankCell(shopName name:String, shopPoint point:String){
        
        self.shopName.text = name
        self.shopPoint.text = point
        
    }
    
}