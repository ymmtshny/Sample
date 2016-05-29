//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var sentence:String = "You bought "
let appleStr = " apples "
let orangeStr = " oranges "
var a:Int = 1
var b:Int = 3

//convert int to string
let aString = String(a)
let bString = String(b)

sentence = sentence + aString + appleStr + bString + orangeStr
print(sentence)

//符号付き整数
var value1_1 :Int = Int.max
var value1_2 :Int = Int.min
var value2_1 :Int8 = Int8.max
var value2_2 :Int8 = Int8.min
var value3_1 :Int16 = Int16.max
var value3_2 :Int16 = Int16.min
var value4_1 :Int32 = Int32.max
var value4_2 :Int32 = Int32.min
var value5_1 :Int64 = Int64.max
var value5_2 :Int64 = Int64.min

//符号なし整数
var value6_1 :UInt = UInt.max
var value6_2 :UInt = UInt.min
var value7_1 :UInt8 = UInt8.max
var value7_2 :UInt8 = UInt8.min
var value8_1 :UInt16 = UInt16.max
var value8_2 :UInt16 = UInt16.min
var value9_1 :UInt32 = UInt32.max
var value9_2 :UInt32 = UInt32.min
var value10_1 :UInt64 = UInt64.max
var value10_2 :UInt64 = UInt64.min

//BOOL => ture/false
//var switchButton = UISwitch()
//switchButton.on = ture

//Floatは数値型の中で最も演算速度が遅い
var value11_1 :Float = 12.34
var value11_2 :Float = -12.34
var value11_3 :Float = 125.34
var value11_4 :Float = -125.34

//Int to double
let value12_1 = 3
let value12_2 = 0.14159
//let pi = value12_1 + value12_2 //error
let pi = Double(value12_1) + value12_2;
var piInt = Int(pi)


//array
//mutable array
//var 変数名　:[型] = [値]
//要素の追加append関数
//imutableArray
//let 変数名　:[型] = [値]

//String型の配列 [iphone, ipad, macbook, pro, air]
var apple :[String] = [String]()
apple.append("iphone")
apple.append("ipad")
apple.append("macbook")
apple.append("pro")
apple.append("air")

let imutableArray1:[String] = [String]()
//imutableArray1.append("iphone")//ERROR

let imutableArray2:[String] = ["iphone","ipad"]
print(imutableArray2[1])

//dictionary
//var 変数名 :[型] = [キー:値]
var testScoresDic :[String:Int8] = [String:Int8]()
testScoresDic["国語"] = 100
testScoresDic["数学"] = 90
testScoresDic["英語"] = 80

let timeDic :[String:String] = ["lunch":"12:00",
                                "morning":"08:00"]
//nilを代入可能にするoptinal型
//nilを代入可能にする=Optional型でラップする
//nilでないことを保証する＝アンラップ処理(if let文)
var value:String?
value = "Hello"
print(value)

//nilかどうか判断する
if let value = value {
    print("value is not nil")
}


if let _ = value {
    print("value is not nil")
}

//if let 任意の名前 = value
//名前が同じ場合、 アンラップした値の参照が優先される。
if let unwrappedValue = value {
    print(value) //nilかもしれな
    print(unwrappedValue)//nilでない
}

//アンラップ処理前の変数が入り、不具合が起きる余地があるので
//名前な同じにすると良い。if let value = value

//通常nilが入れられないなら、メモリーの解放はどうするのか？


//関数
//func 関数名(引数名: 型) -> 戻り値 {...}
//関数名(引数)

func myVoidFunction() {
    print("myVoidFunction was called")
}

myVoidFunction()

func myVoidFunction(myInteger : Int) {
    print("myVoidFuntion(myInteger : Int) \(myInteger)" )
}

myVoidFunction(10)

//引数に別名を付けることができる
func getTestScoreStringFrom(mathScore score:Int) -> String {
    return "Math socre is \(score)"
}

print(getTestScoreStringFrom(mathScore: 100))


//エラー通知throw
//throwする可能性のある関数
//func 関数名(引数名: 型)throw ->戻り値 {...}
//throw エラータイプのプロトコルに準拠したenum

//エラータイプの宣言
enum MyError:ErrorType{
    case InvalidValue
}

func doubleUp(value:Int) throws -> Int {
    if(value < 0) {
        throw MyError.InvalidValue
    }
    
    return value*2
}

do {
    
    defer {
        print("処理終了 \(NSDate())")
    }
    
    print("処理開始 \(NSDate())")
    var x:Int = try doubleUp(10)
    //var y:Int = try doubleUp(-10)
    print("Success")
    
} catch MyError.InvalidValue {
    print("ERROR")
}

//defer内の処理はメソッド終了時に呼び出されることが保証される


//Type Aliasで型名に別名を指定する
//RGB
let red = UInt8.max

typealias RGBColorCode = UInt8
let bule = RGBColorCode.max

//クラス
//クラス（設計書）->インスタンス

//クラスのインスタンス化
//var インスタンス名 = クラス名()
var radio = UISwitch()


//インスタンス名.プロパティ名 = 値
radio.on = true

//インスタンス名.メソッド名(設定値)
radio.setOn(false, animated: true)


//独自クラスを作成する
/* [Dog]
 *
 * [property]
 *  name
 *  type
 *  birthday
 *
 * [method]
 * bark
 */

class Dog {
    var name = ""
    var type = ""
    var birthday = ""
    
    func bark() {
        print("wanwan")
    }
}

//クラス継承と関数のオーバーライド
class GuideDog:Dog {
    override func bark() {
        super.bark() //スーパークラスのbark呼び出し
        print("kyankyan")
    }
}

var myDog = Dog()
myDog.name = "king"
myDog.type = "unknown"
myDog.birthday = "2016/05/08"
myDog.bark()

var myGuideDog = GuideDog()
myGuideDog.bark()


//継承使いすぎに注意、クラスの機能が把握しづらくなる


//構造体
struct MyStruct {
    var value :String?
    
    func method(value: Int) -> Int {
        let resultValue = 0
        return resultValue
    }
}

//構造体とクラスの違いがよくわからない

//enum
//enum 名前 :型名 {...}

enum Fluit {
    case Apple
    case Orange
}


//タプル(複数の値をまとめる)
//宣言　(変数名1:型名1,変数名2:型名2,変数名3:型名3,...)
//利用　(値,値,値,値,...)

func requestMinAndMax() -> (min:Int, max:Int) {
    return(1, 100)
}

let maxAndMax = requestMinAndMax()
let max = maxAndMax.max
let min = maxAndMax.min


//for loop
//for var index = 0; index < 10; index ++ {
//    print("index" + index);
//}

for index in 0...9 {
    print("index \(index)");
}

for index in 0..<9 {
    print("index \(index)");
}

let animals:[String] = ["fish","bird","cat"]
for animal in animals {
    print(animal)
}

var testInt: Int8 = 100
if testInt < 0 {
    print("less than 0");
} else if testInt > 0 {
    print("greater than 0");
} else if testInt > 50 {
    print("greater than 50"); //これは呼ばれない
}



switch animals[1] {
    case "fish":
            print(0)
    case "bird":
            print(1)
    case "cat":
            print(2)
    default:
            print("others")
}

//Switch and enum
let testVar = Fluit.Orange
switch testVar {
case .Orange:
    print("orange")
    //fallthrough //次のcase文も実行する
case .Apple:
    print("apple")
}


//while文
var count = 1
var result = 0
let whileMax = 10
while count < whileMax {
    result += count
    count += 1;
    print(result)
}


//guard = 変数チェックのための専用構文 if みたいなもの
func buyItem(myMoney :Int?) {
    
    guard let money = myMoney else {
        //処理終了
        return//早々にreturnすることを「早期リターン」と呼ぶ
    }
    
    //購入処理
}

//「早期リターン」をすることで不具合を防ぐ


//filter １０より小さい値を取り出す
var values:[Int] = [11,4,25,16,5]

let results = values.filter{ (x:Int)->Bool in
    if x < 10 {
    return true
    }
    return false
}

print(results)

//practice: print out negative numbers 
var intArray:[Int] = [10,0,-9,-19,100,-99,55,-22,4]
let negativeNumbers = intArray.filter{ (x:Int) ->Bool in
    if x < 0 {
        return true
    }
        return false
}
print(negativeNumbers)

//filter便利！！
let negativeNum = intArray.filter{$0 < 0}
print(negativeNum)


//繰り返し値を変化さえせるmap
let doubleNum = intArray.map{$0 * 2}
print(doubleNum)

//繰り返し、項目の値を順次処理するreduce
let total = intArray.reduce(0, combine:{$0 + $1})
print(total)

//並び替えsort
let sortedArray = intArray.sort({$0 < $1})
print(sortedArray)



//for in where フィルタリング
for sampleInt in intArray where sampleInt < 0 {
    print(sampleInt)
}

//case let where

//for case in


func getFirstDateOfMonth(month: Int) -> NSString{
    let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day],fromDate:  NSDate())
    components.month = month
    components.day = 1
    let firstDateMonth = NSCalendar.currentCalendar().dateFromComponents(components)!
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    return dateFormatter.stringFromDate(firstDateMonth)
}

func getLastDateOfMonth(month: Int) -> NSString{
    let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day],fromDate:  NSDate())
    components.month = month + 1
    components.day = 0
    let firstDateMonth = NSCalendar.currentCalendar().dateFromComponents(components)!
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    return dateFormatter.stringFromDate(firstDateMonth)
}

func getDaysInMonth(month:Int) -> Int {
    
    let dateComponents = NSDateComponents()
    dateComponents.month = 7
    let calendar = NSCalendar.currentCalendar()
    let date = calendar.dateFromComponents(dateComponents)!
    let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
    let numDays = range.length
    return numDays
}


print(getFirstDateOfMonth(5))
print(getLastDateOfMonth(5))
print(getDaysInMonth(5))


let myURLString = "http://www.yahoo.com"

if let myURL = NSURL(string: myURLString) {
    var error: NSError?
    let myHTMLString = try! NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding)
    
    if let error = error {
        print("Error : \(error)")
    } else {
        print("HTML : \(myHTMLString)")
    }
} else {
    print("Error: \(myURLString) doesn't  URL")
}
