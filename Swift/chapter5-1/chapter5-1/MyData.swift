//
//  MyData.swift
//  chapter5-1
//
//  Created by Shinya Yamamoto on 2016/05/13.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import Foundation

class MyData :NSObject, NSCoding{
    var ValueString:String?
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(ValueString, forKey: "ValueString")
    }
    
    required init?(coder aDecoder: NSCoder) {
        ValueString = aDecoder.decodeObjectForKey("ValueString") as? String
    }
}