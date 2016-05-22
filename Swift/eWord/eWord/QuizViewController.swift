//
//  QuizViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var jpLabelA: UIButton!
    @IBOutlet weak var jpLabelB: UIButton!
    @IBOutlet weak var jpLabelC: UIButton!
    @IBOutlet weak var jpLabelD: UIButton!
    
    var wordList = [[String:String]]()
    var currentEnglish = ""
    var answerIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.loadCSVData()
        let quiz = self.getOneQuiz()
        self.setupLabelWithQuizArray(quiz)
        self.speachText(quiz[0])
    }
    
    //MARK:Button
    func setupButtonAction() {
        
        //wordListButton.addTarget(self, action: #selector(ViewController.tapWordListButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
    @IBAction func tapWordListButton(sender: AnyObject) {
        
    }
    
    //MARK:Label
    private func setupLabelWithQuizArray(array: [String]) {
        engLabel.text = array[0]
        jpLabelA.setTitle(array[1], forState: UIControlState.Normal)
        jpLabelB.setTitle(array[2], forState: UIControlState.Normal)
        jpLabelC.setTitle(array[3], forState: UIControlState.Normal)
        jpLabelD.setTitle(array[4], forState: UIControlState.Normal)
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
        
        return dic["english"]
    }
    
    private func getJapaneseFromDictionary(dic :Dictionary<String, String>) -> String! {
        
        return dic["japanese"]
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
    
    //MARK: Text to Speech
    func speachText(string: String) {
        
        let synth = AVSpeechSynthesizer()
        var myUtterance = AVSpeechUtterance(string: "")
        myUtterance = AVSpeechUtterance(string: string)
        myUtterance.rate = 0.5
        synth.speakUtterance(myUtterance)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


