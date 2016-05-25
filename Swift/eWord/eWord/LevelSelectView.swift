//
//  LevelSelectView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/25.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class LevelSelectView :UIView {
    
    
    @IBOutlet weak var mySrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let image :UIImage? = UIImage(named:"world.png")
//        if let image = image {
//            let imageView = UIImageView(image:image)
//            imageView.frame = CGRectMake(0, 0, imageView.frame.size.width, self.frame.size.height);
//            imageView.contentMode = UIViewContentMode.ScaleAspectFill
//            self.mySrollView.addSubview(imageView)
//            self.mySrollView.contentSize = CGSizeMake(imageView.frame.size.width, self.frame.size.height);
//            
//        }
        
        for index in 0...5 {
            let button = UIButton();
            button.setTitle("レベル\(index)", forState: .Normal)
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
            let x = CGFloat(index * 200)
            let y = CGFloat(self.frame.size.height * 0.5)
            button.frame = CGRectMake(x, y, 200, 100)
            self.mySrollView.addSubview(button)
            self.mySrollView.contentSize = CGSizeMake(CGRectGetMaxX(button.frame),self.frame.size.height);
        }

        
    }
        
    
    override init(frame: CGRect) {
         super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
