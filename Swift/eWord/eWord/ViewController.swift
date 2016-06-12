//
//  ViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/20.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift


class ViewController: UIViewController, myTabBarDelegate  {

    let tabBarHeight:CGFloat = 50.0
    var myTabBarView: tabBarView!
    var wordListView:wordListTabelView!
    var quizView: QuizView!
    var levelSelectView:LevelSelectView!
    var calender: calenderView!
    var article: articleView!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.addTabBar()
        self.addWordListTableView()
        //self.addArticelView()
        
    }
    
    
    //MARK:タブバー
    func addTabBar() {
        
        let bundle = NSBundle(forClass: tabBarView.self)
        let myTabBar = bundle.loadNibNamed("tabBarView", owner: nil, options: nil)[0] as! tabBarView
        myTabBar.frame = CGRectMake(0, self.view.frame.height - tabBarHeight, self.view.frame.width, tabBarHeight)
        myTabBar.delegate = self
        self.view.addSubview(myTabBar)
        
    }
    
    func tapTabBarButton(type: BUTTON_TYPE){
        
        self.hideAllViews()
        switch type {
        case .LIST:
            
            if (wordListView == nil) {
                self.addWordListTableView()
            }
            
            self.wordListView.hidden = false
            
            break
        case .QUIZ:
            
            if (levelSelectView == nil) {
                self.addLevelSelectView()
            }
            
            self.levelSelectView.hidden = false
           
            break
        case .RECORD:
            
            if (calender == nil) {
                self.addCanlenderView()
            }
            
            self.calender.hidden = false
            
            break
            
            
        }
        
    }
    
    //MARK:単語リストtableView
    func addWordListTableView() {
        
        let bundle = NSBundle(forClass: wordListTabelView.self)
        wordListView = bundle.loadNibNamed("wordListTabelView", owner: nil, options: nil)[0] as! wordListTabelView
        wordListView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(wordListView)
        
    }
    
    
    //MARK:QuizView
    func addQuizView() {
        
        let bundle = NSBundle(forClass: QuizView.self)
        quizView = bundle.loadNibNamed("QuizView", owner: nil, options: nil)[0] as! QuizView
        quizView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(quizView)
        
    }
    
    
    
    //MARK:LevelSelectView
    func addLevelSelectView() {
        
        let bundle = NSBundle(forClass: LevelSelectView.self)
        levelSelectView = bundle.loadNibNamed("LevelSelectView", owner: nil, options: nil)[0] as! LevelSelectView
        levelSelectView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(levelSelectView)
        
        for button in levelSelectView.levelButtonsArray {
            button.addTarget(self, action: #selector(self.tapLevelButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
    }
    
    @IBAction func tapLevelButton(sender: UIButton) {
        
        print(sender.tag)
        
        if(quizView==nil) {
            self.addQuizView()
        }
        
        quizView.hidden = false;
    }
    
    
    
    
    //MARK:canlenderView
    func addCanlenderView() {
        
        let bundle = NSBundle(forClass: calenderView.self)
        calender = bundle.loadNibNamed("calenderView", owner: nil, options: nil)[0] as! calenderView
        calender.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(calender)
        
    }
    
    
    
    
    //MARK:ArticelView
    func addArticelView() {
        
        let bundle = NSBundle(forClass: articleView.self)
        article = bundle.loadNibNamed("articleView", owner: nil, options: nil)[0] as! articleView
        article.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(article)
        
    }
    
    func hideAllViews() {
        
        self.wordListView?.hidden = true;
        self.quizView?.hidden = true;
        self.levelSelectView?.hidden = true;
        self.calender?.hidden = true;
        self.article?.hidden = true;
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
    


