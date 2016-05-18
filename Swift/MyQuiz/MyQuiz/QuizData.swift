//
//  QuizData.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//
//
// ver1.0 magical record with swift 変数保存できるようにする
// ver1.1 エンビバンスの忘却曲線方程式を組む。
// ver1.2 単語のレベルを増やす。
// ver1.3 例文を追加。保存。
// ver1.3 並び替え問題を追加。
// ver1.4 記事を追加,単語を保存できる。(センター試験で良い)
// ver1.5 サーバー連携 => データを取れるようにする。(200問以上解いた人のデータ)


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
        
        let questionNumber = getRandomNumber(englishArray.count)
        let dummyAnsNumber1 = getRandomNumber(englishArray.count)
        let dummyAnsNumber2 = getRandomNumber(englishArray.count)
        let dummyAnsNumber3 = getRandomNumber(englishArray.count)
        
        quiz.append(englishArray[questionNumber])
        quiz.append(japaneseArray[questionNumber])
        quiz.append(japaneseArray[dummyAnsNumber1])
        quiz.append(japaneseArray[dummyAnsNumber2])
        quiz.append(japaneseArray[dummyAnsNumber3])
        self.shuffleAnswers()
    }
    
    private func shuffleAnswers() {
        
        let answer = quiz[1]
        let random = getRandomNumber(4) + 1 //1 to 5
        let dummy = quiz[random]
        quiz[1] = dummy
        quiz[random] = answer
        
    }
    
    private func getRandomNumber(maximun: Int) -> Int{
     
        let count = UInt32(maximun)
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
