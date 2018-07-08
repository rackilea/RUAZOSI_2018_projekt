//
//  FirstPlayerResultViewController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 08/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class FirstPlayerResultViewController: UIViewController {

    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func nextPlayerTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var firstPlayerNickname: String = ""
    var score: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        constructCurrentPlayerLabel()
        scoreLabel.text = String(score)
    }

    func constructCurrentPlayerLabel() -> Void {
        if(self.firstPlayerNickname != "") {
            currentPlayerLabel.text = self.firstPlayerNickname
        } else {
            currentPlayerLabel.text = "SCORE"
        }
    }
}
