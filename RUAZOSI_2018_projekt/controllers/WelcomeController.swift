//
//  WelcomeController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Lea Rački on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnTraining: UIButton!
    @IBOutlet var btnNewGame: UIButton!
    @IBOutlet var btnHighscores: UIButton!
    
    @IBAction func onClick(_ sender: UIButton) {
        fadeOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImage.image = UIImage(named: "background.jpg")
        
        lblTitle.alpha = 0
        self.lblTitle.transform = CGAffineTransform(scaleX: 0, y: 0)
        btnTraining.alpha = 0
        btnNewGame.alpha = 0
        btnHighscores.alpha = 0
        
        setupBtnCornersRadius()
    }
    
    func setupBtnCornersRadius() {
        btnTraining.layer.cornerRadius = 17
        btnTraining.clipsToBounds = true
        
        btnNewGame.layer.cornerRadius = 17
        btnNewGame.clipsToBounds = true
        
        btnHighscores.layer.cornerRadius = 17
        btnHighscores.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.lblTitle.transform = CGAffineTransform.identity
        self.btnTraining.transform = CGAffineTransform.identity
        self.btnNewGame.transform = CGAffineTransform.identity
        self.btnHighscores.transform = CGAffineTransform.identity
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
            self.lblTitle.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.lblTitle.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnTraining.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnNewGame.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnHighscores.alpha = 1
        })
    }
    
    func fadeOut() {
    
        UIView.animate(withDuration: 1, animations: {
            self.lblTitle.center.y = -self.view.bounds.height
            self.lblTitle.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.center.y = -self.view.bounds.height
            self.btnTraining.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.center.y = -self.view.bounds.height
            self.btnNewGame.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.center.y = -self.view.bounds.height
            self.btnHighscores.alpha = 0
        }) //{ _ in
            //let vc = FirstScreen()
            //self.navigationController?.pushViewController(vc, animated: true)
        //}
    }
}
