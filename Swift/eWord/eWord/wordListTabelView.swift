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

    var wordList = [[String:String]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let isLoadedCSVData = defaults.boolForKey("isLoadedWordsCSV");
        if(!isLoadedCSVData){
            wordList = WordsModel().loadCSVData()
        } else {
            wordList = WordsModel().getWord()
        }
        
        self.delegate = self
        self.dataSource = self
        
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
        
        cell.engLabel.text = dic["eng_word"]
        cell.jpLabel.text = dic["jp_word"]
        cell.completeImageView.hidden = !AnswersModel().isCorrectFromEngWord(cell.engLabel.text!)
        cell.lastAnswerDateLabel.text = AnswersModel().getLastAnswerFromEngWord(cell.engLabel.text!)
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dic = self.wordList[indexPath.row]
        if let str = dic["eng_word"]  {
            WordListViewController().speachText(str)
        }
    }

}