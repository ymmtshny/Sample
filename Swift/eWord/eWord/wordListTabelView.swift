//
//  wordListTabelView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/29.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class wordListTabelView :UITableView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTabBarView: tabBarView!

    var wordList = [[String:String]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.loadCSVData()
        self.delegate = self;
        self.dataSource = self;

        
    }
    
    override init(frame: CGRect, style: UITableViewStyle){
        super.init(frame: frame, style: style)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
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

}