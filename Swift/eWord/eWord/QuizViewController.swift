//
//  QuizViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController, myTabBarDelegate {
    
    
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var jpButtonA: UIButton!
    @IBOutlet weak var jpButtonB: UIButton!
    @IBOutlet weak var jpButtonC: UIButton!
    @IBOutlet weak var jpButtonD: UIButton!
    @IBOutlet weak var check_image: UIImageView!
    
    var wordList = [[String:String]]()
    var currentQuizDic = [String:String]() //現在の問題の英語と答えを格納したDictionary
    var answerIdx = 0

    var quizView: QuizViewController?
    var recordView: RecordViewController?
    var listView: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.loadCSVData()
        self.setupButtonAction()
        self.setQuestion()
        self.addTabBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if quizView == nil {
            quizView = QuizViewController()
        }
        
        if listView == nil {
            listView = ViewController()
        }
        
        if recordView == nil {
            recordView = RecordViewController()
        }
        
        
    }
    
    func setQuestion() {
        let quiz = self.getOneQuiz()
        self.setupLabelWithQuizArray(quiz)
        self.speachText(quiz[0])
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
            if let listView = listView {
                listView.listView = listView
                listView.quizView = self
                listView.recordView = recordView
                self.navigationController?.pushViewController(listView, animated: false)
            }
            break
        case BUTTON_TYPE.QUIZ:
    
            break
        case BUTTON_TYPE.RECORD:
            if let recordView = recordView {
                recordView.listView = listView
                recordView.quizView = self
                recordView.recordView = recordView
                self.navigationController?.pushViewController(recordView, animated: false)
            }
            break
        }
        
    }
    
    //MARK:Button
    func setupButtonAction() {
        
        let buttons = [jpButtonA, jpButtonB, jpButtonC, jpButtonD]
        for button in buttons {
            button.addTarget(self, action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.layer.cornerRadius = 15;
            button.layer.borderColor = UIColor(red: 245.0/255.0, green: 166.0/255.0, blue: 35.0/255.0, alpha: 1.0).CGColor
            button.layer.borderWidth = 2
        }
        
    }
    
    @IBAction func tapAnswerButton(sender: UIButton) {
        
        //check if the answer is correct
        let userAnswer = sender.titleLabel?.text
        let quizAnswer = currentQuizDic["japanese"]
        
        check_image.hidden = false
        
        if userAnswer == quizAnswer {
            print("CORRECT")
            self.check_image.image = UIImage(named:"correct")!
        } else {
            print("WRONG")
            self.check_image.image = UIImage(named:"wrong")!
        }
        
//        UIView.animateWithDuration(0.5, animations: {
//            self.check_image.hidden = true
//            self.setQuestion()
//        })
        
        self.check_image.hidden = true
        self.setQuestion()
        
    }
    
    
    //MARK:Label
    private func setupLabelWithQuizArray(array: [String]) {
        engLabel.text = array[0]
        jpButtonA.setTitle(array[1], forState: UIControlState.Normal)
        jpButtonB.setTitle(array[2], forState: UIControlState.Normal)
        jpButtonC.setTitle(array[3], forState: UIControlState.Normal)
        jpButtonD.setTitle(array[4], forState: UIControlState.Normal)
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


