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
    var myTabBarView: tabBarView = tabBarView()
    var wordListView:wordListTabelView = wordListTabelView()
    var quizView: QuizView = QuizView()
    var levelSelectView:LevelSelectView = LevelSelectView()
    var calender: calenderView = calenderView()
    var article: articleView = articleView()
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.addTabBar()
        self.addCanlenderView()
        self.addArticelView()
        self.addWordListTableView()
        self.addQuizView()
        self.addLevelSelectView()
        self.hideAllViews()
        
    }
    
    //MARK:単語リストtableView
    func addWordListTableView() {
        
        let bundle = NSBundle(forClass: wordListTabelView.self)
        wordListView = bundle.loadNibNamed("wordListTabelView", owner: nil, options: nil)[0] as! wordListTabelView
        wordListView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(wordListView)
        
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
            self.wordListView.hidden = false;
            break
        case .QUIZ:
            self.quizView.hidden = false;
            self.levelSelectView.hidden = false;
            break
        case .RECORD:
            self.article.hidden = true;
            break
        }
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
        
    }
    
    
    
    //MARK:canlenderView
    func addCanlenderView() {
        
        let bundle = NSBundle(forClass: calenderView.self)
        let calender = bundle.loadNibNamed("calenderView", owner: nil, options: nil)[0] as! calenderView
        calender.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(calender)
        
    }
    
    
    
    
    //MARK:ArticelView
    func addArticelView() {
        
        let bundle = NSBundle(forClass: articleView.self)
        let article = bundle.loadNibNamed("articleView", owner: nil, options: nil)[0] as! articleView
        article.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - self.tabBarHeight)
        self.view.addSubview(article)
        
    }
    
    func hideAllViews() {
        
        self.wordListView.hidden = true;
        self.quizView.hidden = true;
        self.levelSelectView.hidden = true;
        self.calender.hidden = true;
        self.article.hidden = true;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
    


