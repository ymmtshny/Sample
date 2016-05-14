//
//  ViewController.swift
//  myToDoList
//
//  Created by Shinya Yamamoto on 2016/05/13.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView :UITableView!
    var todoList = [MyTodo]()
    let userDefalts = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //NSDataとして保存されているtodoListを引っ張ってくる。
        self.getTodoListFromUserDefaults()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAddButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "TODO追加",
                                                message: "TODOを追加してください",
                                                preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler(nil);
        
        let okAction = UIAlertAction(title: "ok",
                                     style: UIAlertActionStyle.Default) {
                                        (action:UIAlertAction) -> Void in
                                        
                                        //配列に追加
                                        if let text = alertController.textFields?.first?.text {
                                            
                                            let NewTodo = MyTodo()
                                            NewTodo.todoTitle = text
                                            self.todoList.insert(NewTodo, atIndex: 0);
                                        }
                                        
                                        //テーブルビューに追加
                                        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)],
                                                                              withRowAnimation: UITableViewRowAnimation.Right)
                                        
                                        //NSDataとして保存する。
                                        self.saveTodoListIntoUserDefaults()
                                        
                                        
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style:UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func saveTodoListIntoUserDefaults() {
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(self.todoList)
        self.userDefalts.setObject(archivedData, forKey: "data")
        self.userDefalts.synchronize()
    }
    
    func getTodoListFromUserDefaults() {
        if let storeData = userDefalts.dataForKey("data") {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(storeData) as? [MyTodo] {
                todoList = unarchivedData
                for todo in todoList {
                    print("\(todo.todoTitle) + \(todo.isCompleted)")
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath);
        let todo = todoList[indexPath.row]
        if let todoTitle = todo.todoTitle {
            cell.textLabel!.text = todoTitle
        }
        
        if todo.isCompleted {
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let todo = self.todoList[indexPath.row]
        
        print(todo.isCompleted)
        
        
        if todo.isCompleted {
            todo.isCompleted = false
        } else {
            todo.isCompleted = true
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        self.saveTodoListIntoUserDefaults()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            todoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            self.saveTodoListIntoUserDefaults()
        }
    }
}

