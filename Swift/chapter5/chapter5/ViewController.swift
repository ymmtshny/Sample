//
//  ViewController.swift
//  chapter5
//
//  Created by Shinya Yamamoto on 2016/05/13.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func save(sender:AnyObject) {
        //NSUserDefalutsの作成
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        //TextFiledの文字をuserDefaultsに保存する
        userDefaults.setObject(textField.text, forKey: "text")
        
        //永続ファイルに同期処理
        userDefaults.synchronize()
        
        
    }
    
    override func viewDidLoad() {
        
        //画面表示処理
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(ViewController.save(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //NSUserDefaultsの作成
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        //NSUserDefaultsからtextキーに対応する値を取り出す
        let value = userDefaults.stringForKey("text")
        
        //取り出しか結果、値が存在するならば、テキストフィールドに表示する
        if let value = userDefaults.stringForKey("text") {
            
            textField.text = value
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

