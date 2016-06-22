//: Playground - noun: a place where people can play

import UIKit

//Playgroundで非同期処理をするため
import XCPlayground

//非同期処理の実行を許可する
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let session = NSURLSession.sharedSession()

let url = NSURL(string: "http://www.yahoo.co.jp/")!

let request = NSURLRequest(URL: url)

let task = session.dataTaskWithRequest(request){
    (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
    
    //レスポンスデータを文字列に変換して出力
    if let data = data {
        let value = NSString(data: data, encoding:NSUTF8StringEncoding)
        print(value)
    } else {
        print(error)
    }
}

task.resume()


