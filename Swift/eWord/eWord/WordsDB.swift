////
////  WordsDB.swift
////  eWord
////
////  Created by Shinya Yamamoto on 2016/05/21.
////  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
////
//
//import RealmSwift
//
//class WordsDB: Object {
//    
//    dynamic var level = ""
//    dynamic var eng_word = ""
//    dynamic var jp_word = ""
//    dynamic var eng_sentence = ""
//    dynamic var jp_sentence = ""
//    let usersData = List<UsersDB>()
//    
//    //MARK:setter
//    
//    
//    func setWordsData(word:WordsDB,
//                      level:String,
//                      eng_word:String,
//                      jp_word:String,
//                      eng_sentence:String,
//                      jp_sentence:String,
//                      userDataArray:[UsersDB]) {
//        
//        word.level = level
//        word.eng_word = eng_word
//        word.jp_word = jp_word
//        word.eng_sentence = eng_sentence
//        word.jp_sentence = jp_sentence
//        
//        for userdata in userDataArray {
//            word.usersData.append(userdata)
//        }
//    }
//    
//    //MARK:getter
//    func getWordsDB() -> [[String:String]]{
//
//        var dicArray = [[String:String]]()
//        
//        let realm = try! Realm()
//        let results = realm.objects(WordsDB)
//
//        for result in results {
//            var dictinary = [String:String]()
//            print("eng_word:\((result as WordsDB).eng_word)")
//            dictinary["eng_word"] = (result as WordsDB).eng_word;
//            dictinary["jp_word"] = (result as WordsDB).jp_word;
//            dicArray.append(dictinary);
//        }
//    
//        print(dicArray)
//        return dicArray;
//        
//    }
//    
//    func getWord(eng_word:String) -> WordsDB? {
//        
//        let realm = try! Realm()
//        let predicate = NSPredicate(format: "eng_word = %@", "\(eng_word)")
//        let word = realm.objects(WordsDB.self).filter(predicate).first
//        return word
//        
//    }
//    
//    //MARK:save
//    func saveWordsDB(word:WordsDB) {
//        
//        do {
//            let realm = try Realm()
//            
//            try realm.write {
//                realm.add(word)
//            }
//        } catch {
//            print("saveWordsDB ERROR")
//            
//        }
//        
//    }
//    
//    //MARK:update
//    func updateWordsDB(word:WordsDB,
//                       level:String,
//                       eng_word:String,
//                       jp_word:String,
//                       eng_sentence:String,
//                       jp_sentence:String,
//                       userDataArray:[UsersDB]) {
//        
//        
//        do {
//            let realm = try! Realm()
//            
//            let word = realm.objects(WordsDB.self).filter("eng_word = \(eng_word)").first!
//            try  realm.write {
//                word.level = level
//                word.eng_word = eng_word
//                word.jp_word = jp_word
//                word.eng_sentence = eng_sentence
//                word.jp_sentence = jp_sentence
//                
//                for userdata in userDataArray {
//                    word.usersData.append(userdata)
//                }
//            }
//            
//        } catch {
//            
//            print("updateWordsDB ERROR")
//            
//        }
//    }
//    
//    
//    // データの削除
//    func deleteAll() {
//        
//        do {
//            let realm = try! Realm()
//            
//            try  realm.write {
//             
//                 //全てのデータ
//                 realm.deleteAll()
//                
//            }
//        } catch {
//            
//        }
//    }
//    
//    
//    
//    
//    
//    func deleteLastWordsData() {
//        
//        do {
//            
//            let realm = try! Realm()
//            let word = realm.objects(WordsDB).last!
//            try  realm.write {
//                // 最後のデータ
//                realm.delete(word)
//                
//            }
//            
//        } catch {
//            
//            print("deleteLastWordsData ERROR")
//            
//        }
//        
//    }
//    
//    //MARK:CSV
//    func loadCSVData()-> [[String:String]]{
//        
//        var wordList = [[String:String]]()
//        if let csvFilePath = NSBundle.mainBundle().pathForResource("words", ofType: "csv") {
//            
//            do {
//                if let csvStringData: String = try String(contentsOfFile: csvFilePath) {
//                    
//                    let array = csvStringData.characters.split{$0 == ","}.map(String.init)
//                    var enArray = [String]()
//                    var jpArray = [String]()
//                    var word: Dictionary = [String:String]()
//                    var wordsdb = WordsDB()
//                    // wordsdb.deleteAll()
//                    
//                    
//                    for index in 0...array.count-1 {
//                        
//                        let data = array[index]
//                        
//                        if(index % 2 == 0) {
//                            wordsdb = WordsDB()
//                            enArray.append(data)
//                            wordsdb.eng_word = data
//                            
//                        } else {
//                            
//                            jpArray.append(data)
//                            wordsdb.jp_word = data
//                            wordsdb.saveWordsDB(wordsdb)
//                        }
//                        
//                        
//                        
//                    }
//                    
//                    for index in 0...enArray.count-1 {
//                        
//                        word["eng_word"] = enArray[index]
//                        word["jp_word"] = jpArray[index]
//                        wordList.append(word)
//                    }
//                    
//                    
//                    //csv一回読み込んでrealmに保存したよと。
//                    let defaults = NSUserDefaults.standardUserDefaults()
//                    defaults.setBool(true, forKey: "isLoadedWordsCSV")
//                }
//                
//            } catch let error {
//                
//                print(error)
//            }
//            
//        }
//        
//        return wordList;
//    }
//
//}
//
//

//
//class UsersDB: Object {
//
//    dynamic var isCorrect = ""
//    dynamic var answer_duration = ""
//    dynamic var answer_date = ""
//    
//    func setUsersData(userdata:UsersDB,
//                      isCorrect: String,
//                      answer_duration: String,
//                      answer_date:String) {
//        
//        userdata.isCorrect = isCorrect
//        userdata.answer_duration = answer_duration
//        userdata.answer_date = answer_date
//        
//    }
//    
//    func setUserData(userdata:UsersDB, word:WordsDB) {
//        
//        try! realm!.write {
//            word.usersData.append(userdata);
//        }
//        
//    }
//    
//    func getUsersDB() {
//        
//        let realm = try! Realm()
//        let dataContent = realm.objects(UsersDB)
//        print(dataContent)
//        
//    }
//    
//    //とりあえずはじめに正解していたらtrue
//    func getIsCorrectFromEngWord(eng_word:String) -> Bool {
//
//        let wordData = WordsDB().getWord(eng_word)
//        let usersDataArray = wordData!.usersData
//        let userDataWithCorrect = usersDataArray.first
//        
//        if userDataWithCorrect==nil {
//            return false
//        } else {
//            return true
//        }
//     
//    }
//    
//    func getLastAnswerDataFromEngWord(eng_word:String) -> String {
//        
//        let wordData = WordsDB().getWord(eng_word)
//        let usersDataArray = wordData!.usersData
//        let userDataWithDate = usersDataArray.last
//        
//        if userDataWithDate==nil {
//            return "未解答"
//        } else {
//            return (userDataWithDate?.answer_date)!
//        }
//        
//    }
//    
//    func saveUsersDB(userdata:UsersDB) {
//        
//        do {
//            let realm = try Realm()
//            
//            try realm.write {
//                realm.add(userdata)
//            }
//        } catch {
//            print("saveUsersDB ERROR")
//            
//        }
//        
//    }
//    
//    
//    func deleteLastUsersData() {
//        
//        do {
//            
//            let realm = try! Realm()
//            let user = realm.objects(UsersDB).last!
//            try  realm.write {
//                // 最後のデータ
//                realm.delete(user)
//                // 全てのデータ
//                // realm.deleteAll()
//                
//            }
//            
//        } catch {
//            print("deleteLastUsersData ERROR")
//        }
//    }
//    
//    func deleteAllUsersData() {
//        
//        do {
//            
//            let realm = try! Realm()
//            try  realm.write {
//                
//                realm.deleteAll()
//                
//            }
//            
//        } catch {
//            
//            print("deleteAllUsersData ERROR")
//            
//        }
//    }
//    
//}
//
//
