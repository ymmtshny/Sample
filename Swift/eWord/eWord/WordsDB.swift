//
//  WordsDB.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/21.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import RealmSwift

class WordsDB: Object {
    
    dynamic var level = ""
    dynamic var eng_word = ""
    dynamic var jp_word = ""
    dynamic var eng_sentence = ""
    dynamic var jp_sentence = ""
    let usersData = List<UsersDB>()
    
    //MARK:setter
    
    
    func setWordsData(word:WordsDB,
                      level:String,
                      eng_word:String,
                      jp_word:String,
                      eng_sentence:String,
                      jp_sentence:String,
                      userDataArray:[UsersDB]) {
        
        word.level = level
        word.eng_word = eng_word
        word.jp_word = jp_word
        word.eng_sentence = eng_sentence
        word.jp_sentence = jp_sentence
        
        for userdata in userDataArray {
            word.usersData.append(userdata)
        }
    }
    
    //MARK:getter
    func getWordsDB() -> [[String:String]]{

        var dicArray = [[String:String]]()
        
        let realm = try! Realm()
        let results = realm.objects(WordsDB)

        for result in results {
            var dictinary = [String:String]()
            print("eng_word:\((result as WordsDB).eng_word)")
            dictinary["eng_word"] = (result as WordsDB).eng_word;
            dictinary["jp_word"] = (result as WordsDB).jp_word;
            dicArray.append(dictinary);
        }
    
        print(dicArray)
        return dicArray;
        
    }
    
    func getWord(eng_word:String) -> WordsDB? {
        
        let realm = try! Realm()
        let predicate = NSPredicate(format: "eng_word = %@", "\(eng_word)")
        let word = realm.objects(WordsDB.self).filter(predicate).first!
        return word
        
    }
    
    //MARK:save
    func saveWordsDB(word:WordsDB) {
        
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.add(word)
            }
        } catch {
            print("saveWordsDB ERROR")
            
        }
        
    }
    
    //MARK:update
    func updateWordsDB(word:WordsDB,
                       level:String,
                       eng_word:String,
                       jp_word:String,
                       eng_sentence:String,
                       jp_sentence:String,
                       userDataArray:[UsersDB]) {
        
        
        do {
            let realm = try! Realm()
            
            let word = realm.objects(WordsDB.self).filter("eng_word = \(eng_word)").first!
            try  realm.write {
                word.level = level
                word.eng_word = eng_word
                word.jp_word = jp_word
                word.eng_sentence = eng_sentence
                word.jp_sentence = jp_sentence
                
                for userdata in userDataArray {
                    word.usersData.append(userdata)
                }
            }
            
        } catch {
            
            print("updateWordsDB ERROR")
            
        }
    }
    
    
    // データの削除
    func deleteAll() {
        
        do {
            let realm = try! Realm()
            
            try  realm.write {
             
                 //全てのデータ
                 realm.deleteAll()
                
            }
        } catch {
            
        }
    }
    
    
    
    
    
    func deleteLastWordsData() {
        
        do {
            
            let realm = try! Realm()
            let word = realm.objects(WordsDB).last!
            try  realm.write {
                // 最後のデータ
                realm.delete(word)
                
            }
            
        } catch {
            
            print("deleteLastWordsData ERROR")
            
        }
        
    }


}


//isCompeleted
//isCompeletedByUser
//correctRate
//-----------------


//正解 isCorrect
//解答時間 answer_duration
//解答日時 answer_date

//--------------
/*

 正解率　｜　80% 　| 60%  　|  40%  |   20%
           ７日後 | 翌日出題|　すぐに出題。
 
 userが自ら覚えたとマークした場合、翌日以降出題 => ok なら覚えたとする。
 
 クイズ１回１０問 20%(3) 40%(3) 60%(3) 80%(1)
 
 
 */

class UsersDB: Object {

    dynamic var isCorrect = ""
    dynamic var answer_duration = ""
    dynamic var answer_date = ""
    
    func setUsersData(userdata:UsersDB,
                      isCorrect: String,
                      answer_duration: String,
                      answer_date:String) {
        
        userdata.isCorrect = isCorrect
        userdata.answer_duration = answer_duration
        userdata.answer_date = answer_date
        
    }
    
    func setUserData(userdata:UsersDB, word:WordsDB) {
        
        try! realm!.write {
            word.usersData.append(userdata);
        }
        
    }
    
    func getUsersDB() {
        
        let realm = try! Realm()
        let dataContent = realm.objects(UsersDB)
        print(dataContent)
        
    }
    func saveUsersDB(userdata:UsersDB) {
        
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.add(userdata)
            }
        } catch {
            print("saveUsersDB ERROR")
            
        }
        
    }
    
    
    func deleteLastUsersData() {
        
        do {
            
            let realm = try! Realm()
            let user = realm.objects(UsersDB).last!
            try  realm.write {
                // 最後のデータ
                realm.delete(user)
                // 全てのデータ
                // realm.deleteAll()
                
            }
            
        } catch {
            print("deleteLastUsersData ERROR")
        }
    }
    
    func deleteAllUsersData() {
        
        do {
            
            let realm = try! Realm()
            try  realm.write {
                
                realm.deleteAll()
                
            }
            
        } catch {
            
            print("deleteAllUsersData ERROR")
            
        }
    }
    
}


