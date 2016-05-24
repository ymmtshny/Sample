//
//  RecordViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, myTabBarDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        self.addTabBar()
    
    }

    //MARK:タブバー
    func addTabBar() {
        
        let bundle = NSBundle(forClass: tabBarView.self)
        let myTabBar = bundle.loadNibNamed("tabBarView", owner: nil, options: nil)[0] as! tabBarView
        myTabBar.frame = CGRectMake(0, self.view.frame.height - 49, self.view.frame.width, 49)
        myTabBar.delegate = self
        self.view.addSubview(myTabBar)
        
    }
    
    func tapTabBarButton(type: BUTTON_TYPE){
        
        switch type {
        case BUTTON_TYPE.LSIT:
            let ListView = ViewController()
            self.navigationController?.pushViewController(ListView, animated: false)
            break
        case BUTTON_TYPE.QUIZ:
            let QuizView = QuizViewController()
            self.navigationController?.pushViewController(QuizView, animated: false)
            break
        case BUTTON_TYPE.RECORD:
            
            break
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

