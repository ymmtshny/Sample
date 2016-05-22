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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var wordListTableView: UITableView!
    
    @IBOutlet weak var wordListButton: UIButton!
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    let RecordView:RecordViewController = RecordViewController()
    let QuizView:QuizViewController = QuizViewController()
    
    var wordList = [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.wordListTableView.delegate = self
        self.wordListTableView.dataSource = self
        self.loadCSVData()

        self.setupButtonAction()
    }
    

    //MARK:ボタン
    func setupButtonAction() {
        
        wordListButton.addTarget(self, action: #selector(ViewController.tapWordListButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        quizButton.addTarget(self, action: #selector(ViewController.tapQuizButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        recordButton.addTarget(self, action: #selector(ViewController.tapRecordButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    @IBAction func tapWordListButton(sender: AnyObject) {
        
    }
    
    @IBAction func tapQuizButton(sender: AnyObject) {
        
        self.navigationController?.pushViewController(QuizView, animated: true)
    }
    
    @IBAction func tapRecordButton(sender: AnyObject) {
        QuizView
        self.navigationController?.pushViewController(RecordView, animated: true)
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
    


