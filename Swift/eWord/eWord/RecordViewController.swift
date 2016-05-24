//
//  RecordViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var wordListButton: UIButton!
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.setupButtonAction()
    }
    
    func setupButtonAction() {
        
        wordListButton.addTarget(self, action: #selector(ViewController.tapWordListButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        quizButton.addTarget(self, action: #selector(ViewController.tapQuizButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        recordButton.addTarget(self, action: #selector(ViewController.tapRecordButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    @IBAction func tapWordListButton(sender: AnyObject) {
        
        let wordView:ViewController = ViewController()
        self.navigationController?.pushViewController(wordView, animated: false)
    }
    
    @IBAction func tapQuizButton(sender: AnyObject) {
        let QuizView:QuizViewController = QuizViewController()
        self.navigationController?.pushViewController(QuizView, animated: false)
    }
    
    @IBAction func tapRecordButton(sender: AnyObject) {
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

