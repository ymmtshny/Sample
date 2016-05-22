//
//  RealmMethod.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import Foundation
import RealmSwift

//MARK:setter
 func setUsersData(userdata:UsersDB,
                  answer_time: String,
                  correct_times: String,
                  solve_times:String) {
    
    userdata.answer_time = answer_time
    userdata.correct_times = correct_times
    userdata.solve_times = solve_times
    
}

 func setUserData(userdata:UsersDB, word:WordsDB) {
    word.usersData.append(userdata);
}

 func setWordsData(word:WordsDB,
                  id:String,
                  eng_word:String,
                  jp_word:String,
                  eng_sentence:String,
                  jp_sentence:String,
                  userDataArray:[UsersDB]) {
    
    word.id = id
    word.eng_word = eng_word
    word.jp_word = jp_word
    word.eng_sentence = eng_sentence
    word.jp_sentence = jp_sentence
    
    for userdata in userDataArray {
        word.usersData.append(userdata)
    }
}

//MARK:getter
 func getUsersDB() {
    
    let realm = try! Realm()
    let dataContent = realm.objects(UsersDB)
    print(dataContent)
    
}

 func getWordsDB() {
    
    let realm = try! Realm()
    let dataContent = realm.objects(WordsDB)
    print(dataContent)
    
}

//MARK:save
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
 func updateUsersDB(answer_time: String,
                   correct_times: String,
                   solve_times:String) {
    
    do {
        let realm = try! Realm()
        
        let userdata = realm.objects(UsersDB).last!
        try realm.write {
            userdata.answer_time = answer_time
            userdata.correct_times = correct_times
            userdata.solve_times = solve_times
        }
        
    } catch {
        
        print("updateUsersDB ERROR")
        
    }
}


 func updateWordsDB(word:WordsDB,
                   id:String,
                   eng_word:String,
                   jp_word:String,
                   eng_sentence:String,
                   jp_sentence:String,
                   userDataArray:[UsersDB]) {
    
    
    do {
        let realm = try! Realm()
        
        let word = realm.objects(WordsDB).last!
        try  realm.write {
            word.id = id
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
 func dataDelete() {
    
    do {
        let realm = try! Realm()
        
        let user = realm.objects(WordsDB).last!
        try  realm.write {
            // 最後のデータ
            realm.delete(user)
            // 全てのデータ
            // realm.deleteAll()
            
        }
    } catch {
        
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


