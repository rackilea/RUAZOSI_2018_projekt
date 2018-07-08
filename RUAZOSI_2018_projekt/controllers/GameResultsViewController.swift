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
        prepareForAnimation()
        firstPlayerUsernameLabel.text = firstPlayerUsername
        secondPlayerUsernameLabel.text = secondPlayerUsername
        firstPlayerScoreLabel.text = String(firstPlayerScore)
        secondPlayerScoreLabel.text = String(secondPlayerScore)
        
        if(firstPlayerScore == secondPlayerScore) {
            winnerUsernameLabel.text = "IT'S A TIE"
        } else {
            winnerUsernameLabel.text = winner
        }
        animate()
    }
    
    
    func prepareForAnimation() -> Void {
//        firstPlayerUsernameLabel.alpha = 0
//        secondPlayerUsernameLabel.alpha = 0
//        firstPlayerScoreLabel.alpha = 0
//        secondPlayerScoreLabel.alpha = 0
        winnerUsernameLabel.alpha = 0
        winnerUsernameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    func animate() -> Void {
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.winnerUsernameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.winnerUsernameLabel.alpha = 1
        })
    }
}
