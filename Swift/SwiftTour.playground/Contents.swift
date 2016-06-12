//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//you do not need to write ; at the end
print("Hello, world!")
print("Hello, world!");


var myVariable = 22
myVariable = 44
let myConstant = 100
//myConstant = 0 error because myConstant is constant!!

let apples = 3;
let oranges = 5;
let applesSummary = "I have \(apples) apples."
var fruitSUmmary = "I have \(apples + oranges) pieces of fruit."
fruitSUmmary = "I have apples + oranges pieces of fruit."

let bornYear = 1993
let thisYear = 2016
let myName = "Shinya Yamamoto"
let greeting = "My name is " + myName + ". I am \(thisYear - bornYear) years old."

//Array
var shoppingList = ["catfish", "water", "tulips","blue paint"]
shoppingList[1] = "bottole of water"
print(shoppingList)
print(shoppingList[1])

var occupations = [
    "Malcolm": "Captain",
    "Kaylee" : "Mechanic",
]

occupations["Jayne"] = "Public Relations"

print(occupations["Malcolm"])
print(occupations)

//crate empty array
var emptyArray = [String]()
var emptyDictionary = [String: Float]()

//unknown type
emptyArray = []
emptyDictionary = [:]



let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        
        teamScore += 3
        
    } else {
        
        teamScore += 1
        
    }
}

print(teamScore)

let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy/mm/dd/ hh:mm:ss"
let date = dateFormatter.stringFromDate(NSDate())