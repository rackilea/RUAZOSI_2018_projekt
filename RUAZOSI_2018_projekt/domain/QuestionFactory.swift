//
//  QuestionFactory.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 07/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import Foundation

class QuestionFactory {
    
    static func createQuestion(level: Int) -> Question {
        return Question(lvl: level);
    }
    
}
