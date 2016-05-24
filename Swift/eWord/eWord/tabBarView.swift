//
//  tabBarView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/24.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

enum BUTTON_TYPE :Int{
    case LSIT
    case QUIZ
    case RECORD
}

protocol myTabBarDelegate {
    
    func tapTabBarButton(type: BUTTON_TYPE)
    
}

class tabBarView :UIView {
    
    @IBOutlet weak var wordListButton: UIButton?
    @IBOutlet weak var quizButton: UIButton?
    @IBOutlet weak var recordButton: UIButton?

    var delegate:myTabBarDelegate?
    var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupButtonAction()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        //loadViewFromNib()
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
//    func loadViewFromNib() {
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let nib = UINib(nibName: "tabBarView", bundle: bundle)
//        let view = nib.instantiateWithOwner(nil, options: nil)[0] as! tabBarView
//        self.addSubview(view);
//        
//        
//    }
    
   
    //MARK:ボタン
    func setupButtonAction() {
        
        if let wordListButton = wordListButton {
            wordListButton.addTarget(self, action: #selector(self.tapWordListButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        if let quizButton = quizButton {
            quizButton.addTarget(self, action: #selector(self.tapQuizButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        if let recordButton = recordButton {
            recordButton.addTarget(self, action: #selector(self.tapRecordButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
    }
    
    
    
    @IBAction func tapWordListButton(sender: AnyObject) {
        
        self.delegate?.tapTabBarButton(BUTTON_TYPE.LSIT)
        
    }
    
    @IBAction func tapQuizButton(sender: AnyObject) {
        
        self.delegate?.tapTabBarButton(BUTTON_TYPE.QUIZ)
    }
    
    @IBAction func tapRecordButton(sender: AnyObject) {
    
        self.delegate?.tapTabBarButton(BUTTON_TYPE.RECORD)
    }

}
