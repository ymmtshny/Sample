//
//  itemCell.swift
//  WebAPISample
//
//  Created by Shinya Yamamoto on 2016/06/19.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class itemCell:UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemShop: UILabel!
    
    var itemImageURL:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.layoutSubviews()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setItemImageWith(url_string:String) {
        //self.itemImage.image =
        
        if let url = NSURL(string:url_string) {
        
            do {
                let imgData: NSData = try NSData(contentsOfURL:url,options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let img = UIImage(data:imgData);
                self.itemImage.image = img;
            } catch {
                print("Error: can't create image.")
            }
            
        }
        
        
        
    }
    
}