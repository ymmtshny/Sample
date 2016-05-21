//
//  WordsDB.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/21.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import RealmSwift

class WordsDB: Object {
    
    dynamic var id = ""
    dynamic var eng_word = ""
    dynamic var jp_word = ""
    dynamic var eng_sentence = ""
    dynamic var jp_sentence = ""
    let usersData = List<UsersDB>()

}

class UsersDB: Object {

    dynamic var correct_times = ""
    dynamic var answer_time = ""
    dynamic var solve_times = ""
    
}


