//
//  QuizViewController.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AudioToolbox

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel?
    @IBOutlet weak var answerLabelA: UILabel?
    @IBOutlet weak var answerLabelB: UILabel?
    @IBOutlet weak var answerLabelC: UILabel?
    @IBOutlet weak var answerLabelD: UILabel?
    
    @IBOutlet weak var answerButtonA : UIButton!
    @IBOutlet weak var answerButtonB : UIButton!
    @IBOutlet weak var answerButtonC : UIButton!
    @IBOutlet weak var answerButtonD : UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    let maru : UIImage = UIImage(named:"maru")!
    let bastu : UIImage = UIImage(named:"batsu")!
    
    let quizData = QuizData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkImage?.alpha = 0
        updateQuiz()
        updateUILabels()
        setupButtonActions()
    }
    
    private func updateUILabels() {
        questionLabel?.text = quizData.quiz[0]
        answerLabelA?.text = quizData.quiz[1]
        answerLabelB?.text = quizData.quiz[2]
        answerLabelC?.text = quizData.quiz[3]
        answerLabelD?.text = quizData.quiz[4]
        
    }
    
    private func updateQuiz() {
        
        quizData.createOneQuiz()
        
    }
    
    private func setupButtonActions () {
        
        answerButtonA.addTarget(self, action: #selector(QuizViewController.tapAnswerButtonA(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonB.addTarget(self, action: #selector(QuizViewController.tapAnswerButtonB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonC.addTarget(self, action: #selector(QuizViewController.tapAnswerButtonC(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonD.addTarget(self, action: #selector(QuizViewController.tapAnswerButtonD(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    @IBAction func tapAnswerButtonA (sender : AnyObject) {
    
        if let answerText =  answerLabelA?.text {
            if let questionText = questionLabel?.text {
                
                let isCorrect = quizData.checkCorrect(questionText, jp: answerText)
                showCheckImage(isCorrect)
            }
        }
        
        
        updateQuiz()
        updateUILabels()
        
    }
    
    @IBAction func tapAnswerButtonB (sender : AnyObject) {
        
        if let answerText =  answerLabelB?.text {
            if let questionText = questionLabel?.text {
                
                let isCorrect = quizData.checkCorrect(questionText, jp: answerText)
                showCheckImage(isCorrect)
            }
        }
        
        updateQuiz()
        updateUILabels()
        
    }
    
    @IBAction func tapAnswerButtonC (sender : AnyObject) {
        
        if let answerText =  answerLabelC?.text {
            if let questionText = questionLabel?.text {
                
                let isCorrect = quizData.checkCorrect(questionText, jp: answerText)
                showCheckImage(isCorrect)
            }
        }

        updateQuiz()
        updateUILabels()
        
    }
    
    @IBAction func tapAnswerButtonD (sender : AnyObject) {
        
        if let answerText =  answerLabelD?.text {
            if let questionText = questionLabel?.text {
                
                let isCorrect = quizData.checkCorrect(questionText, jp: answerText)
                showCheckImage(isCorrect)
            }
        }

        updateQuiz()
        updateUILabels()
        
    }
    
    
    func showCheckImage(isCorrect : Bool) {
        
        if #available(iOS 9.0, *) {
            AudioServicesPlaySystemSoundWithCompletion(1000){ () -> Void  in
                
            }
        } else {
            print("ios version is old")
        }
        
        if isCorrect {
            checkImage?.image = maru
        } else {
            checkImage?.image = bastu
        }
        
        self.checkImage?.alpha = 1
        
        
        
        UIView.animateWithDuration(0.5, animations: {
          
            self.checkImage?.alpha = 0
            
        })
        
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
