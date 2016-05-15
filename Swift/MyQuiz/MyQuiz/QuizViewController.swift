//
//  QuizViewController.swift
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        creatQuizDataInstance()
        
        setupButtonActions()
    }
    
    private func creatQuizDataInstance() {

        let quizData = QuizData()
        
        questionLabel?.text = quizData.quiz[0]
        answerLabelA?.text = quizData.quiz[1]
        answerLabelB?.text = quizData.quiz[2]
        answerLabelC?.text = quizData.quiz[3]
        answerLabelD?.text = quizData.quiz[4]
        
    }
    
    
    private func setupButtonActions () {
        
        answerButtonA.addTarget(self, action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonB.addTarget(self, action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonC.addTarget(self, action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        answerButtonD.addTarget(self, action: #selector(QuizViewController.tapAnswerButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
    @IBAction func tapAnswerButton (sender : AnyObject) {
        
        creatQuizDataInstance()
        
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
