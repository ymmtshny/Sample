//
//  calenderView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/29.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

//MyCollectionViewCell => xib 

import UIKit

class calenderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myCollectionView.delegate = self;
        self.myCollectionView.dataSource = self;
        self.myCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //
    func getDaysInMonth(month:Int) -> Int {
        
        let dateComponents = NSDateComponents()
        dateComponents.month = 7
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateFromComponents(dateComponents)!
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
        let numDays = range.length
        return numDays
    }
    
    
    //MARK:Delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Section毎にCellの総数を変える.
        if section == 0 {
            return 7
        } else {
            //return dateManager.daysAcquisition() //ここは月によって異なる
            return self.getDaysInMonth(5)
        }
    }

    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCollectionViewCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    // セルのサイズを返却する
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(myCollectionView.frame.size.width/7, myCollectionView.frame.size.width/7)
    }
    
    
}