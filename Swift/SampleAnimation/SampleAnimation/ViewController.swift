//
//  ViewController.swift
//  SampleAnimation
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        myview.frame.size = CGSizeMake(100, 100)
        myview.center = self.view.center
        myview.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(myview)
        
        let button = UIButton()
        button.frame.size = CGSizeMake(100, 50)
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y + 200
        button.setTitle("button", forState: UIControlState.Normal)
        button.backgroundColor  = UIColor.blueColor()
        button.addTarget(self, action:#selector(ViewController.tapButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    
    @IBAction func tapButton(sender :AnyObject) {
        
        
        let animation = CABasicAnimation(keyPath:"cornerRadious")
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionDefault)
        animation.fromValue = 0
        animation.toValue = 50
        animation.duration = 3000
        
        myview.layer.addAnimation(animation, forKey: "cornerRadious")
        myview.layer.cornerRadius = 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

