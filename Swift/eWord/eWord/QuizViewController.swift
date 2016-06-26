//
//  QuizViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/06/26.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizView: QuizView!
    var levelSelectView:LevelSelectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addQuizView()
        //self.addLevelSelectView()
        
    }
    
    //MARK:QuizView
    func addQuizView() {
        
        let bundle = NSBundle(forClass: QuizView.self)
        quizView = bundle.loadNibNamed("QuizView", owner: nil, options: nil)[0] as! QuizView
        quizView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(quizView)
        
    }
    
    
    
    //MARK:LevelSelectView
    func addLevelSelectView() {
        
        let bundle = NSBundle(forClass: LevelSelectView.self)
        levelSelectView = bundle.loadNibNamed("LevelSelectView", owner: nil, options: nil)[0] as! LevelSelectView
        levelSelectView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
