//
//  StartViewController.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    let quizVC: QuizViewController = QuizViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        startButton.addTarget(self, action: #selector(StartViewController.tapStartButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        if let csvFilePath = NSBundle.mainBundle().pathForResource("words", ofType: "csv") {
        
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath) {
                    
                    
                    let array = csvStringData.characters.split{$0 == ","}.map(String.init)
                    
                    var englishArray = [String]()
                    var japaneseArray = [String]()
                    
                    
                    
                    var index = 0
                    for str in array {
                        
                        if(index % 2 == 0) {
                            englishArray.append(str)
                        } else {
                            japaneseArray.append(str)
                        }
                        
                        index = index + 1
                    }
                    
                    print(englishArray[0])
                    print(japaneseArray[30])
                    print(japaneseArray[0])
                    print(japaneseArray[10])
                    print(japaneseArray[5])
                    
                    
                    
                    
                    
                }
            } catch let error {
                
                print(error)
            }
            
        }
    
    }
    
    @IBAction func tapStartButton(sender: AnyObject) {
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
