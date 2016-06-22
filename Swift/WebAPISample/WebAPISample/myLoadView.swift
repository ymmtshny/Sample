//
//  loadView.swift
//  WebAPISample
//
//  Created by Shinya Yamamoto on 2016/06/19.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit


class myLoadView: UIView {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
