//
//  ViewController.swift
//  chapter2
//
//  Created by Shinya Yamamoto on 2016/05/08.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mathLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let x = 100;
        let y = 44;
        mathLabel.text = "\(x)+\(y)=\(x+y)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

