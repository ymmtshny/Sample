//
//  itemDetailViewController.swift
//  WebAPISample
//
//  Created by Shinya Yamamoto on 2016/06/19.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class itemDetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemWebView: UIWebView!
    var itemPageURL:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // URLを設定する.
        let url: NSURL = NSURL(string: itemPageURL)!
        
        // リクエストを作成する.
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // リクエストを実行する.
        itemWebView.loadRequest(request)
        itemWebView.scalesPageToFit = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
