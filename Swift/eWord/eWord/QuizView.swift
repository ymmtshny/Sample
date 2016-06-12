//
//  LevelSelectView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/25.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class QuizView :UIView {
    
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var jpButtonA: UIButton!
    @IBOutlet weak var jpButtonB: UIButton!
    @IBOutlet weak var jpButtonC: UIButton!
    @IBOutlet weak var jpButtonD: UIButton!
    @IBOutlet weak var check_image: UIImageView!
    
    var wordList = [[String:String]]()
    var currentQuizDic = [String:String]() //現在の問題の英語と答えを格納したDictionary
    var answerIdx = 0
    
    //MARK:init関連
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let isLoadedCSVData = defaults.boolForKey("isLoadedWordsCSV");
        if(!isLoadedCSVData){
            wordList = WordsDB().loadCSVData()
        } else {
            wordList = WordsDB().getWordsDB()
        }
        self.setupButtonAction()
        self.setQuestion()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setQuestion() {
        let quiz = self.getOneQuiz()
        self.setupLabelWithQuizArray(quiz)
        ViewController().speachText(quiz[0])
    }
    
    //MARK:Button
    func setupButtonAction() {
        
        let buttons = [jpButtonA, jpButtonB, jpButtonC, jpButtonD]
        
        for button in buttons {
            
            button.addTarget(self, action: #selector(QuizView.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.layer.cornerRadius = 15;
            button.layer.borderColor = UIColor(red: 245.0/255.0, green: 166.0/255.0, blue: 35.0/255.0, alpha: 1.0).CGColor
            button.layer.borderWidth = 2
            
        }
        
    }
    
    @IBAction func tapAnswerButton(sender: UIButton) {
        
        //check if the answer is correct
        let userAnswer = sender.titleLabel?.text
        let quizAnswer = currentQuizDic["jp_word"]
        
        check_image.hidden = false
        
        let userdb = UsersDB()
        var word = WordsDB()
        userdb.answer_duration = "10s"
        userdb.answer_date = self.getCurrentDateTime()
        
        if userAnswer == quizAnswer {
            
            print("CORRECT")
            self.check_image.image = UIImage(named:"correct")!
            userdb.isCorrect = "true"
            
        } else {
            
            print("WRONG")
            self.check_image.image = UIImage(named:"wrong")!
            userdb.isCorrect = "false"
        }
        
        userdb.saveUsersDB(userdb)
        word = word.getWord((engLabel?.text)!)!
        userdb.setUserData(userdb, word: word)
        print(word)
        
        //        UIView.animateWithDuration(0.5, animations: {
        //            self.check_image.hidden = true
        //            self.setQuestion()
        //        })
        
        self.check_image.hidden = true
        self.setQuestion()
        
    }
    
    private func getCurrentDateTime() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd/hh/mm/ss"
        let date = dateFormatter.stringFromDate(NSDate())
        return date
    }
    
    
    //MARK:Label
    private func setupLabelWithQuizArray(array: [String]) {
        engLabel?.text = array[0]
        jpButtonA?.setTitle(array[1], forState: UIControlState.Normal)
        jpButtonB?.setTitle(array[2], forState: UIControlState.Normal)
        jpButtonC?.setTitle(array[3], forState: UIControlState.Normal)
        jpButtonD?.setTitle(array[4], forState: UIControlState.Normal)
    }
    
    //MARK:Quiz
    private func getOneQuiz() -> [String]{
        
        let idxA = self.getRandomNumberWithMax(wordList.count)
        let idxB = self.getRandomNumberWithMax(wordList.count)
        let idxC = self.getRandomNumberWithMax(wordList.count)
        let idxD = self.getRandomNumberWithMax(wordList.count)
        
        let dicA = wordList[idxA]
        let dicB = wordList[idxB]
        let dicC = wordList[idxC]
        let dicD = wordList[idxD]
        
        let question = self.getEnglishFromDictionary(dicA)
        let answerA = self.getJapaneseFromDictionary(dicA)
        let answerB = self.getJapaneseFromDictionary(dicB)
        let answerC = self.getJapaneseFromDictionary(dicC)
        let answerD = self.getJapaneseFromDictionary(dicD)
        
        currentQuizDic = dicA
        
        var quizArray = [question!, answerA!, answerB!, answerC!, answerD!]
        quizArray = self.shuffleArray(quizArray)
        
        return quizArray
        
    }
    
    private func shuffleArray(array:[String]) -> [String] {
        var array = array
        let idx = self.getRandomNumberWithMax(array.count)
        let elem = array[idx]
        let answer = array[1] //答え
        if idx != 0 {//array[0]は英語
            
            array[idx] = answer
            array[1] = elem
            self.answerIdx = idx
            
        } else {
            
            self.answerIdx = 1
        }
        return array
        
    }
    
    private func getRandomNumberWithMax(max: Int) -> Int {
        let count = UInt32(max)
        let random = arc4random_uniform(count)
        let randomInt = Int(random)
        return randomInt
    }
    
    private func getWordAtIndex(idx :Int) -> Dictionary<String, String> {
        
        return wordList[idx]
    }
    
    private func getEnglishFromDictionary(dic :Dictionary<String, String>) -> String! {
        
        return dic["eng_word"]
    }
    
    private func getJapaneseFromDictionary(dic :Dictionary<String, String>) -> String! {
        
        return dic["jp_word"]
    }
    

}
