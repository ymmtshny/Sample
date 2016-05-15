//
//  QuizView.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class QuizView: UIView {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel_A: UILabel!
    @IBOutlet weak var answerLabel_B: UILabel!
    @IBOutlet weak var answerLabel_C: UILabel!
    @IBOutlet weak var answerLabel_D: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    // コードから初期化はここから
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    // Storyboard/xib から初期化はここから
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // xibからカスタムViewを読み込んで準備する
    private func loadXib() {
        // .xib からカスタムViewをロードする
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "QuizView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        addSubview(view)
    }
    
    private func setupButtonAction() {
        
    }
    
    private func loadQuestionsArrayFromCSV() {
        
    }
    
    private func checkAnswer() {

    }
    
    private func calculateCorrectRate() {
        
    }

}
