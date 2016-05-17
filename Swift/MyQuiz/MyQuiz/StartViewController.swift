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
    let tableVC: WordListViewController = WordListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addToolBarButtons()
    }
    
    private func addToolBarButtons() {
     
        self.navigationController?.toolbarHidden = false
        var items = [UIBarButtonItem]()
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        )
        
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .Add, target: self,  action: #selector(StartViewController.tapTestButton(_:)))
        )
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        )
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .Add, target: self,  action: #selector(StartViewController.tapStartButton(_:)))
        )
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        )
        
        
        self.navigationController?.toolbar.items = items
        
        self.setToolbarItems(items, animated: true)
        
        startButton.addTarget(self, action: #selector(StartViewController.tapStartButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    @IBAction func tapStartButton(sender: AnyObject) {
        
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    
    @IBAction func tapTestButton(sender: AnyObject) {
        
        self.navigationController?.pushViewController(tableVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
