//
//  QuizViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController, myTabBarDelegate {

    var quizView: QuizViewController?
    var recordView: RecordViewController?
    var listView: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        
        self.addQuizView()
        //self.addScrollview()
        //self.addTabBar()
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
    
    func addQuizView() {
        
        let bundle = NSBundle(forClass: QuizView.self)
        let scrollview = bundle.loadNibNamed("QuizView", owner: self, options: nil)[0] as! QuizView
        scrollview.frame = CGRectMake(0,0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(scrollview)
        
    }
    
    func addScrollview() {
        
        let bundle = NSBundle(forClass: LevelSelectView.self)
        let scrollview = bundle.loadNibNamed("LevelSelectView", owner: self, options: nil)[0] as! LevelSelectView
        scrollview.frame = CGRectMake(0,0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(scrollview)
        
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
                listView.quizView = self
                listView.recordView = recordView
                
                self.presentViewController(listView, animated: false, completion: nil)
                self.dismissViewControllerAnimated(false, completion: nil)
            }
            break
        case BUTTON_TYPE.QUIZ:
    
            break
        case BUTTON_TYPE.RECORD:
            if let recordView = recordView {
                recordView.listView = listView
                recordView.quizView = self
                recordView.recordView = recordView
                
                self.presentViewController(recordView, animated: false, completion: nil)
                self.dismissViewControllerAnimated(false, completion: nil)
            }
            break
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


