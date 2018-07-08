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
    var counter: Int = 0
    var correctAnswerValue: Double = 0
    var game: Game?
    
    func setUpNextQuestion() -> Void {
        setUpForAnimation()
        createNewQuestion()
        updateViewWithQuestionData()
        animateEverythingIn()
    }
    
    func correctAnswer() -> Void {
        self.counter += 1
        animateEverythingOut() {
            self.setUpNextQuestion()}
    }
    
    @IBAction func answerAction(_ sender: UIButton) {
        if (sender.currentTitle == String(self.correctAnswerValue)) {
            correctAnswer()
        }
        else {
            
            if let currentGame = self.game {
                if (currentGame.firstPlayerFinished) {
                    currentGame.secondPlayerScore = self.counter
                    
                    let gameResultViewController = GameResultsViewController()
                    gameResultViewController.firstPlayerUsername = currentGame.firstPlayer
                    gameResultViewController.secondPlayerUsername = currentGame.secondPlayer
                    gameResultViewController.firstPlayerScore = currentGame.firstPlayerScore
                    gameResultViewController.secondPlayerScore = currentGame.secondPlayerScore
                    
                    gameResultViewController.winner = currentGame.getWinner()
                    
                    self.navigationController?.pushViewController(gameResultViewController, animated: true)
                } else {
                    currentGame.firstPlayerFinished = true
                    currentGame.firstPlayerScore = self.counter
                    let firstPlayerResultViewController = FirstPlayerResultViewController()
                    firstPlayerResultViewController.firstPlayerNickname = currentGame.firstPlayer
                    firstPlayerResultViewController.score = self.counter
                    self.navigationController?.pushViewController(firstPlayerResultViewController, animated: true)
                }
            } else {
                let wrongAnswerController = WrongAnswerController()
                wrongAnswerController.currentScore = String(self.counter)
                self.navigationController?.pushViewController(wrongAnswerController, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.counter = 0
        setUpNextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = false
        
        self.answerButtons[0].layer.cornerRadius = 10
        self.answerButtons[1].layer.cornerRadius = 10
        self.answerButtons[2].layer.cornerRadius = 10
        self.answerButtons[3].layer.cornerRadius = 10
        
        setUpNextQuestion()
    }
    
    func createNewQuestion() -> Void {
        question = QuestionFactory.createQuestion(level: calculateLevel())
        if let questionTmp = question {
            correctAnswerValue = questionTmp.answers[0]
        }
    }
    
    func calculateLevel() -> Int {
        return self.counter / 5 + 1
    }
    
    func updateViewWithQuestionData() {
        if let currentQuestion = self.question {
            currentQuestion.answers.shuffle()
            
            self.questionLabel.text = currentQuestion.question
            self.answerButtons[0].setTitle(String(currentQuestion.answers[0]), for: [])
            self.answerButtons[1].setTitle(String(currentQuestion.answers[1]), for: [])
            self.answerButtons[2].setTitle(String(currentQuestion.answers[2]), for: [])
            self.answerButtons[3].setTitle(String(currentQuestion.answers[3]), for: [])
        }
    }

    func animateEverythingOut(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.questionLabel.center.y = -self.view.bounds.height
            self.questionLabel.alpha = 0
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseInOut], animations: {
            self.answerButtons[0].center.x = -self.view.bounds.width
            self.answerButtons[0].alpha = 0
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.15, options: [.curveEaseInOut], animations: {
            self.answerButtons[1].center.x = -self.view.bounds.width
            self.answerButtons[1].alpha = 0
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.20, options: [.curveEaseInOut], animations: {
            self.answerButtons[2].center.x = -self.view.bounds.width
            self.answerButtons[2].alpha = 0
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.25, options: [.curveEaseInOut], animations: {
            self.answerButtons[3].center.x = -self.view.bounds.width
            self.answerButtons[3].alpha = 0
        }) { _ in
            completion()
        }
    }
    
    func animateEverythingIn() {
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.questionLabel.center.y = +self.view.bounds.height
            self.questionLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseInOut], animations: {
            self.answerButtons[0].center.x = +self.view.bounds.width
            self.answerButtons[0].alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.15, options: [.curveEaseInOut], animations: {
            self.answerButtons[1].center.x = +self.view.bounds.width
            self.answerButtons[1].alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.20, options: [.curveEaseInOut], animations: {
            self.answerButtons[2].center.x = +self.view.bounds.width
            self.answerButtons[2].alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.25, options: [.curveEaseInOut], animations: {
            self.answerButtons[3].center.x = +self.view.bounds.width
            self.answerButtons[3].alpha = 1
        })
    }

    func setUpForAnimation() -> Void {
        self.questionLabel.alpha = 0
        self.answerButtons[0].alpha = 0
        self.answerButtons[1].alpha = 0
        self.answerButtons[2].alpha = 0
        self.answerButtons[3].alpha = 0
        self.questionLabel.center.y = -self.view.bounds.height
        self.answerButtons[0].center.x = -self.view.bounds.width
        self.answerButtons[1].center.x = -self.view.bounds.width
        self.answerButtons[2].center.x = -self.view.bounds.width
        self.answerButtons[3].center.x = -self.view.bounds.width
    }
}

extension Array {
    mutating func shuffle() {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}
