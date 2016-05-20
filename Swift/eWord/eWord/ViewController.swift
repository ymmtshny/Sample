//
//  ViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/20.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        // スキーマバージョンを上げる。デフォルトのスキーマバージョンは0
//        let config = Realm.Configuration(schemaVersion: 1)
//        Realm.Configuration.defaultConfiguration = config
        
        self.userReact()
        self.saveUserData()
        self.getUserData()
        self.Content()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    let word = WordsDB()
    var userdata = UsersDB()
    
    func userReact() {
        userdata.answer_time = "5"
        userdata.correct_times = "3"
        userdata.solve_times = "10"
    }
    
    func saveUserData() {
        
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.add(self.userdata)
            }
        } catch {
            // Error handling...
            
        }
    }
    
    func getUserData() {
        
        let realm = try! Realm()
        let dataContent = realm.objects(UsersDB)
        print(dataContent)
        
    }
    
    
    // 内容
    func addUserData() {
        word.usersData.append(userdata);
    }
    
    func Content() {
        
        word.id = "1"
        word.eng_word = "hello"
        word.jp_word = "こんにちは"
        word.eng_sentence = "hello everyone"
        word.jp_sentence = "皆さん、こんにちは"
        word.usersData.append(self.userdata)
        
            
        self.save()
        //self.dataUpdate()
        //self.dataDelete()
        self.dataGet()
    }
    
    
    // データの保存
    func save() {
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.add(self.word)
            }
        } catch {
            // Error handling...
            
        }
    }
    
    // データの取得
    func dataGet() {
       
        let realm = try! Realm()
        let dataContent = realm.objects(WordsDB)
        print(dataContent)
       
    }
    
    // データの更新
    func dataUpdate() {
        
        do {
            let realm = try! Realm()
        
            let user = realm.objects(WordsDB).last!
            try  realm.write {
                //user.name = "Yamasaki Tarou"
            }
        } catch {
            
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
    
}

