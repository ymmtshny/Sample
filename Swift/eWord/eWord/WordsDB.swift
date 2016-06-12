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
    func getWordsDB() {
        
        let realm = try! Realm()
        let dataContent = realm.objects(WordsDB)
        print(dataContent)
        
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

    dynamic var correct_times = "" //正解回数
    dynamic var answer_duration = ""   //解答時間　0~10sec
    dynamic var solve_times = ""   //回答日数
    dynamic var solve_date = ""    //解答日時
    
    func setUsersData(userdata:UsersDB,
                      answer_duration: String,
                      correct_times: String,
                      solve_times:String,
                      solve_date:String) {
        
        userdata.answer_duration = answer_duration
        userdata.correct_times = correct_times
        userdata.solve_times = solve_times
        userdata.solve_date = solve_date
        
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
    
    func updateUsersDB(answer_duration: String,
                       correct_times: String,
                       solve_times:String) {
        
        do {
            let realm = try! Realm()
            
            let userdata = realm.objects(UsersDB).last!
            try realm.write {
                userdata.answer_duration = answer_duration
                userdata.correct_times = correct_times
                userdata.solve_times = solve_times
            }
            
        } catch {
            
            print("updateUsersDB ERROR")
            
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


