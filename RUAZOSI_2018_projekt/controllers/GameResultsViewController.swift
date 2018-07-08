//
//  GameResultsViewController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 08/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class GameResultsViewController: UIViewController {

    @IBOutlet weak var firstPlayerUsernameLabel: UILabel!
    @IBOutlet weak var firstPlayerScoreLabel: UILabel!
    
    @IBOutlet weak var secondPlayerUsernameLabel: UILabel!
    @IBOutlet weak var secondPlayerScoreLabel: UILabel!
    
    @IBOutlet weak var winnerUsernameLabel: UILabel!
    
    var firstPlayerUsername: String = ""
    var secondPlayerUsername: String = ""
    
    var firstPlayerScore: Int = 0
    var secondPlayerScore: Int = 0
    
    var winner: String = ""
    
    @IBAction func highScoresTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstPlayerUsernameLabel.text = firstPlayerUsername
        secondPlayerUsernameLabel.text = secondPlayerUsername
        firstPlayerScoreLabel.text = String(firstPlayerScore)
        secondPlayerScoreLabel.text = String(secondPlayerScore)
        winnerUsernameLabel.text = winner
    }
}
