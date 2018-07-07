//
//  QuestionController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!

    
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    var question: Question? = nil
    
    
    @IBAction func answerAction(_ sender: UIButton) {
        animateEverythingOut();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animateEverythingIn()
        
        question = QuestionFactory.createQuestion(level: 1)
        
        setUpQuestion()
        
    }
    
    func setUpQuestion() {
        if let currentQuestion = self.question {
            self.questionLabel.text = currentQuestion.question
            self.answerButtons[0].setTitle(String(currentQuestion.answers[0]), for: [])
            self.answerButtons[1].setTitle(String(currentQuestion.answers[1]), for: [])
            self.answerButtons[2].setTitle(String(currentQuestion.answers[2]), for: [])
            self.answerButtons[3].setTitle(String(currentQuestion.answers[3]), for: [])
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.questionLabel.transform = CGAffineTransform.identity
        self.answerButtons[0].transform = CGAffineTransform.identity
        self.answerButtons[1].transform = CGAffineTransform.identity
        self.answerButtons[2].transform = CGAffineTransform.identity
        self.answerButtons[3].transform = CGAffineTransform.identity
    }

    func animateEverythingOut() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.questionLabel.center.y = -self.view.bounds.height
            self.questionLabel.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.35, options: [.curveEaseInOut], animations: {
            self.answerButtons[0].center.x = -self.view.bounds.width
            self.answerButtons[0].alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.40, options: [.curveEaseInOut], animations: {
            self.answerButtons[1].center.x = -self.view.bounds.width
            self.answerButtons[1].alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: [.curveEaseInOut], animations: {
            self.answerButtons[2].center.x = -self.view.bounds.width
            self.answerButtons[2].alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.50, options: [.curveEaseInOut], animations: {
            self.answerButtons[3].center.x = -self.view.bounds.width
            self.answerButtons[3].alpha = 0
        }) { _ in
            let vc = WelcomeController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    func animateEverythingIn() {
        self.answerButtons[0].alpha = 0
        self.answerButtons[1].alpha = 0
        self.answerButtons[2].alpha = 0
        self.answerButtons[3].alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.questionLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.questionLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.35, options: [.curveEaseInOut], animations: {
            
            self.answerButtons[0].center.x = +self.view.bounds.width
            self.answerButtons[0].alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.40, options: [.curveEaseInOut], animations: {
            
            self.answerButtons[1].center.x = +150
            self.answerButtons[1].alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: [.curveEaseInOut], animations: {
            
            self.answerButtons[2].center.x = +150
            self.answerButtons[2].alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.50, options: [.curveEaseInOut], animations: {
            
            self.answerButtons[3].center.x = +150
            self.answerButtons[3].alpha = 1
        })
        
    }


}
