//
//  QuizData.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class QuizData: NSObject {

    var englishArray = [String]()
    var japaneseArray = [String]()
    var quiz = [String]() //[question, ans1, ans2, ans3, ans4]
    
    override init() {
        
        super.init()
        
        loadCSVData()
        
    }
    
    func createOneQuiz (){
        
        quiz.removeAll()
        
        let questionNumber = getRandomNumber()
        let dummyAnsNumber1 = getRandomNumber()
        let dummyAnsNumber2 = getRandomNumber()
        let dummyAnsNumber3 = getRandomNumber()
        
        quiz.append(englishArray[questionNumber])
        quiz.append(japaneseArray[questionNumber])
        quiz.append(japaneseArray[dummyAnsNumber1])
        quiz.append(japaneseArray[dummyAnsNumber2])
        quiz.append(japaneseArray[dummyAnsNumber3])
        
        
    }
    
    private func shuffleAnswers() {
        
    }
    
    private func getRandomNumber() -> Int{
     
        let count = UInt32(englishArray.count)
        let random = arc4random_uniform(count)
        let randomInt = Int(random)
        return randomInt
    }
    
    
    func checkCorrect(eng:String, jp:String) -> Bool {
        
        let idx = getIndexOfEnglishArray(eng)
        
        if(jp == japaneseArray[idx]) {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
    
    private func getIndexOfEnglishArray(engStr :String) -> Int {
        
        var index = 0
        for str in englishArray {
            
            if(str == engStr) {
                return index
            }
            
            index = index + 1
        }
        
        return 0
        
    }
    
    private func getIndexOfJapaneseArray(jpStr :String) -> Int {
        
        var index = 0
        for str in japaneseArray {
            
            if(str == jpStr) {
                return index
            }
            
            index = index + 1
        }
        
        return 0 //this shouldn't happen
        
    }
    
    private func loadCSVData() {
        
        if let csvFilePath = NSBundle.mainBundle().pathForResource("words", ofType: "csv") {
            
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath) {
                    
                    let array = csvStringData.characters.split{$0 == ","}.map(String.init)
                    
                    var index = 0
                    for str in array {
                        
                        if(index % 2 == 0) {
                            englishArray.append(str)
                        } else {
                            japaneseArray.append(str)
                        }
                        
                        index = index + 1
                    }
                    
                    print(array)
                }
                
            } catch let error {
                
                print(error)
            }
            
        }
    }
    
    
    
}
