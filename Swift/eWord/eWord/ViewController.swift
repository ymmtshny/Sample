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


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, myTabBarDelegate  {

    
    @IBOutlet weak var wordListTableView: UITableView!
    @IBOutlet weak var myTabBarView: tabBarView!
    
    var wordList = [[String:String]]()
    
    private var onceTokenViewDidAppear: dispatch_once_t = 0
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.wordListTableView.delegate = self
        self.wordListTableView.dataSource = self
        self.loadCSVData()
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
                break
            case BUTTON_TYPE.QUIZ:
                let QuizView = QuizViewController()
                self.navigationController?.pushViewController(QuizView, animated: false)
                break
            case BUTTON_TYPE.RECORD:
                let RecordView = RecordViewController()
                self.navigationController?.pushViewController(RecordView, animated: false)
                break
        }
        
    }
    
    
    //MARK: Text to Speech
    func speachText(string: String) {
        
        let synth = AVSpeechSynthesizer()
        var myUtterance = AVSpeechUtterance(string: "")
        myUtterance = AVSpeechUtterance(string: string)
        myUtterance.rate = 0.5
        synth.speakUtterance(myUtterance)
    }
    
    //MARK:テーブルビュー
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wordList.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell = NSBundle.mainBundle().loadNibNamed("CustomCell", owner: self, options: nil).first as! CustomCell
        
        let dic = self.wordList[indexPath.row]
        
        cell.engLabel.text = dic["english"]
        cell.jpLabel.text = dic["japanese"]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dic = self.wordList[indexPath.row]
        if let str = dic["english"]  {
            self.speachText(str)
        }
    }

    
    
    
    //MARK:CSV
    private func loadCSVData() {
        
        if let csvFilePath = NSBundle.mainBundle().pathForResource("words", ofType: "csv") {
            
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath) {
                    
                    let array = csvStringData.characters.split{$0 == ","}.map(String.init)
                    var enArray = [String]()
                    var jpArray = [String]()
                    var word: Dictionary = [String:String]()
                    
                    for index in 0...array.count-1 {
                    
                        let data = array[index]
                        
                        if(index % 2 == 0) {
                            
                            enArray.append(data)
                        
                        } else {
                            
                            jpArray.append(data)
                        }
                
                    }
                    
                    for index in 0...enArray.count-1 {
                        
                        word["english"] = enArray[index]
                        word["japanese"] = jpArray[index]
                        wordList.append(word)
                    }
                    
                    print(array)
                }
                
            } catch let error {
                
                print(error)
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
    


