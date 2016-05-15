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
        
    }
    
    @IBAction func tapStartButton(sender: AnyObject) {
        
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
