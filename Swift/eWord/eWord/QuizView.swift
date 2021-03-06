//
//  LevelSelectView.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/05/25.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

protocol QuizViewDelegate {
    
    func tapAnswerButton(sender: UIButton)
    
}

class QuizView :UIView {
    
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var jpButtonA: UIButton!
    @IBOutlet weak var jpButtonB: UIButton!
    @IBOutlet weak var jpButtonC: UIButton!
    @IBOutlet weak var jpButtonD: UIButton!
    @IBOutlet weak var check_image: UIImageView!
    var delegate:QuizViewDelegate?
    
    //MARK:init関連
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupButtonAction()
        self.check_image.alpha = 0
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK:Button
    private func setupButtonAction() {
        
        let buttons = [jpButtonA, jpButtonB, jpButtonC, jpButtonD]
        
        for button in buttons {
            
            button.addTarget(QuizViewController(), action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.layer.cornerRadius = 15;
            button.layer.borderColor = UIColor(red: 245.0/255.0, green: 166.0/255.0, blue: 35.0/255.0, alpha: 1.0).CGColor
            button.layer.borderWidth = 2
            
        }
        
    }
    
    
    //MARK:Label
    internal func setupLabelWithQuizDic(QuizDic: [String:String]) {
        
        engLabel?.text = QuizDic["question"]
        jpButtonA?.setTitle(QuizDic["optionA"], forState: UIControlState.Normal)
        jpButtonB?.setTitle(QuizDic["optionB"], forState: UIControlState.Normal)
        jpButtonC?.setTitle(QuizDic["optionC"], forState: UIControlState.Normal)
        jpButtonD?.setTitle(QuizDic["optionD"], forState: UIControlState.Normal)
    }
    
    @IBAction func tapAnswerButton(sender: UIButton) {
        self.delegate?.tapAnswerButton(sender)
    }
    
    
    
    

}
