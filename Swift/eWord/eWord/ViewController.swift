//
//  ViewController.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/20.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift


class ViewController: UIViewController, myTabBarDelegate  {

    
    @IBOutlet weak var wordListTableView: UITableView!
    @IBOutlet weak var myTabBarView: tabBarView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let config = Realm.Configuration(schemaVersion: 1)
        //Realm.Configuration.defaultConfiguration = config
        
        self.addWordListTableView()
        self.addTabBar()
        
        
    }
    
    //MARK:単語リストtableView
    func addWordListTableView() {
        
        let bundle = NSBundle(forClass: wordListTabelView.self)
        let myTableView = bundle.loadNibNamed("wordListTabelView", owner: nil, options: nil)[0] as! UITableView
        myTableView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 49)
        self.view.addSubview(myTableView)
        
    }
    
    //MARK:タブバー
    func addTabBar() {
        
        let bundle = NSBundle(forClass: tabBarView.self)
        let myTabBar = bundle.loadNibNamed("tabBarView", owner: nil, options: nil)[0] as! tabBarView
        myTabBar.frame = CGRectMake(0, self.view.frame.height - 49, self.view.frame.width, 49)
        myTabBar.delegate = self
        self.view.addSubview(myTabBar)
        
    }
    
    func tapTabBarButton(type: BUTTON_TYPE){
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
    


