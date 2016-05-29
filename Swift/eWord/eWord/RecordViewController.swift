//
//  RecordViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/22.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var quizView: QuizViewController?
    var recordView: RecordViewController?
    var listView: ViewController?
    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        self.addTabBar()
    
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 50, height: 50)
        
        
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
        calendarCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        calendarCollectionView.backgroundColor = UIColor.whiteColor()
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCollectionViewCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.orangeColor()
        return cell
    }
    
    
    //MARK:タブバー
    func addTabBar() {
        
//        let bundle = NSBundle(forClass: tabBarView.self)
//        let myTabBar = bundle.loadNibNamed("tabBarView", owner: nil, options: nil)[0] as! tabBarView
//        myTabBar.frame = CGRectMake(0, self.view.frame.height - 49, self.view.frame.width, 49)
//        myTabBar.delegate = self
//        self.view.addSubview(myTabBar)
        
    }
//    
//    func tapTabBarButton(type: BUTTON_TYPE){
//        
//        switch type {
//        case BUTTON_TYPE.LSIT:
//            if let listView = listView {
//                listView.listView = listView
//                listView.quizView = quizView
//                listView.recordView = self
//                
//                self.presentViewController(listView, animated: false, completion: nil)
//                self.dismissViewControllerAnimated(false, completion: nil)
//            }
//            break
//        case BUTTON_TYPE.QUIZ:
//            if let quizView = quizView {
//                quizView.listView = listView
//                quizView.quizView = quizView
//                quizView.recordView = self
//                
//                self.presentViewController(quizView, animated: false, completion: nil)
//                self.dismissViewControllerAnimated(false, completion: nil)
//            }
//            break
//        case BUTTON_TYPE.RECORD:
//            
//            break
//        }
//        
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

