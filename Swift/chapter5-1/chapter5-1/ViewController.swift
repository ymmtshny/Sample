//
//  ViewController.swift
//  chapter5-1
//
//  Created by Shinya Yamamoto on 2016/05/13.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaluts = NSUserDefaults.standardUserDefaults()
        let data = MyData()
        data.ValueString = "test"
        //userDefaluts.setObject(data, forKey: "data")//NSInvalidArgumentException
        //NSUserDefalutsはNSData型なら保存できるので、一旦NSData型に変換する（シリアライズ）
        //let シリアライズ結果 = NSKeyedArchiver.archviedDataWithRootObject(対象)
        //let でシリアライズ結果 = NSKeyedUnArchiver.unarchviedObjectWithData(対象)
        
        //シリアライズ処理をする。
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(data)
        //NSData型をuserDefalutsに保存
        userDefaluts.setObject(archiveData, forKey: "data")
        userDefaluts.synchronize()
        
        //userDefaltsから保存されたデータを取得し、コンソールに出す。
        if let storeData = userDefaluts.dataForKey("data") {
            if let unarchiveData = NSKeyedUnarchiver.unarchiveObjectWithData(storeData) as? MyData {
                
                print(unarchiveData.ValueString) //アンラップ処理しないと...
                
                if let valueString = unarchiveData.ValueString {
                    print(valueString)//アンラップ処理すると...
                }
            }
            
        }
        
        
        //userDefaltsの中を確認します。
        self.printoutNSUsersDefaults()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printoutNSUsersDefaults() {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let appDomain = NSBundle.mainBundle().bundleIdentifier {
            let dic = userDefaults.persistentDomainForName(appDomain)
            print(dic)
        }
        

    }


}
