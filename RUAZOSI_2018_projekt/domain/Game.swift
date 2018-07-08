//
//  Game.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 08/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import Foundation

class Game {
    
    var firstPlayer: String
    var secondPlayer: String
    
    var firstPlayerScore: Int = 0
    var secondPlayerScore: Int = 0
    
    var firstPlayerFinished: Bool = false
    
    init(firstPlayer: String, secondPlayer: String) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func getWinner() -> String {
        return firstPlayerScore > secondPlayerScore ? firstPlayer : secondPlayer
    }
}
