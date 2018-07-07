//
//  WrongAnswerController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 07/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class WrongAnswerController: UIViewController {

    var currentScore : String = "0"
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBAction func returnToWelcomeScreen(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentScoreLabel.text = currentScore
    }
}
