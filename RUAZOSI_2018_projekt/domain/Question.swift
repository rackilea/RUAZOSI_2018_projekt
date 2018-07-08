//
//  Question.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import Foundation

class Question {

    var answers: [Double] = []
    var question: String = ""
    var level: Int
    
    private var firstOperand: Int = 0
    private var secondOperand: Int = 0
    
    private var operation: MathOperation
    
    init(lvl: Int) {
        self.level = lvl
        
        self.operation = .chooseRandomOperation()
        
        self.firstOperand = chooseOperand()
        self.secondOperand = chooseOperand()
        
        generateAnswers()
        constructQuestion()
    }
    
    private func chooseOperand() -> Int {
        return Int(arc4random() % UInt32(pow(Double(10),Double(level))))
    }
    
    
    private func generateAnswers() -> Void {
        
        let correctAnswer: Double = MathOperation.calculate(first: firstOperand, second: secondOperand, mathOperator: operation)
        self.answers.insert(correctAnswer, at: 0)
        
        var firstWrongAnswer: Double = correctAnswer + Double(arc4random()%2)
        while(self.answers.contains(firstWrongAnswer)) {
            firstWrongAnswer = correctAnswer + Double(arc4random()%2)
        }
        self.answers.insert(firstWrongAnswer, at: 1)
        
        
        var secondWrongAnswer: Double = correctAnswer + Double(arc4random()%2)
        while(self.answers.contains(secondWrongAnswer)) {
            secondWrongAnswer = correctAnswer + Double(arc4random()%3)
        }
        self.answers.insert(secondWrongAnswer, at: 2)
        
        
        var thirdWrongAnswer: Double = correctAnswer + Double(arc4random()%2)
        while(self.answers.contains(thirdWrongAnswer)) {
            thirdWrongAnswer = correctAnswer - Double(arc4random()%3)
        }
        self.answers.insert(thirdWrongAnswer, at: 3)
    }
    
    private func constructQuestion() -> Void {
        self.question = "\(firstOperand) \(operation.mathOperator) \(secondOperand) = "
    }
    
}
