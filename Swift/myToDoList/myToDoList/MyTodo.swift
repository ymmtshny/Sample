//
//  MyTodo.swift
//  myToDoList
//
//  Created by Shinya Yamamoto on 2016/05/14.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class MyTodo: NSObject, NSCoding {

    var todoTitle :String?
    var isCompleted :Bool = false
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(todoTitle, forKey: "todoTitle")
        aCoder.encodeBool(isCompleted, forKey: "isCompleted")
    }
    
    required init?(coder aDecoder: NSCoder)  {
        todoTitle = aDecoder.decodeObjectForKey("todoTitle") as? String
        isCompleted = aDecoder.decodeBoolForKey("isCompleted")
    }
    
    
}
