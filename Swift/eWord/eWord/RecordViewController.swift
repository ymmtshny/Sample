//
//  RecordViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, myTabBarDelegate {
    
    var quizView: QuizViewController?
    var recordView: RecordViewController?
    var listView: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        self.addTabBar()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if quizView == nil {
            quizView = QuizViewController()
        }
        
        if listView == nil {
            listView = ViewController()
        }
        
        if recordView == nil {
            recordView = RecordViewController()
        }
        
        
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
            if let listView = listView {
                listView.listView = listView
                listView.quizView = quizView
                listView.recordView = self
                self.navigationController?.pushViewController(listView, animated: false)
            }
            break
        case BUTTON_TYPE.QUIZ:
            if let quizView = quizView {
                quizView.listView = listView
                quizView.quizView = quizView
                quizView.recordView = self
                self.navigationController?.pushViewController(quizView, animated: false)
            }
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

