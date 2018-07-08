//
//  WelcomeController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Lea Rački on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController, UITextFieldDelegate {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var btnTraining: UIButton!
    @IBOutlet var btnNewGame: UIButton!
    @IBOutlet var btnHighscores: UIButton!
    @IBOutlet var btnDone: UIButton!
    @IBOutlet var btnReturn: UIButton!
    
    @IBOutlet var lblFirstPlayerNickname: UILabel!
    @IBOutlet var inputFirstPlayerNickname: UITextField!
    
    @IBOutlet var lblSecondPlayerNickname: UILabel!
    @IBOutlet var inputSecondPlayerNickname: UITextField!
    
    @IBAction func startTraining(_ sender: UIButton) {
        //let vc = QuestionController()
        animateSinglePlayerNicknameIn()
        fadeOut()
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        //let vc = QuestionController()
        animateTwoPlayerNicknameIn()
        fadeOut()
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewHighscores(_ sender: UIButton) {
        //let vc = QuestionController()
        fadeOut()
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func done(_ sender: UIButton) {
        if (inputFirstPlayerNickname.text!.isEmpty) {
            inputFirstPlayerNickname.jitter()
            return
        }
        if (inputSecondPlayerNickname.alpha == 1) {
            if (inputSecondPlayerNickname.text!.isEmpty) {
                inputSecondPlayerNickname.jitter()
                return
            }
        }
        let vc = QuestionController()
        fadeOut()
        btnDone.alpha = 0
        btnReturn.alpha = 0
        lblFirstPlayerNickname.alpha = 0
        inputFirstPlayerNickname.alpha = 0
        lblSecondPlayerNickname.alpha = 0
        inputSecondPlayerNickname.alpha = 0
        self.navigationController?.pushViewController(vc, animated: true)
        inputFirstPlayerNickname.text = ""
        inputSecondPlayerNickname.text = ""
    }
    
    @IBAction func returnToHomeState(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblFirstPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
            self.lblFirstPlayerNickname.alpha = 0
        })
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputFirstPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
            self.inputFirstPlayerNickname.alpha = 0
        })
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnDone.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnDone.alpha = 0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.btnReturn.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnReturn.alpha = 0
        })
        
        if (self.inputSecondPlayerNickname.alpha == 1) {
            UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
                self.lblSecondPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
                self.lblSecondPlayerNickname.alpha = 0
            })
            UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
                self.inputSecondPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
                self.inputSecondPlayerNickname.alpha = 0
            })
        }
        fadeIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputFirstPlayerNickname.delegate = self
        inputSecondPlayerNickname.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
    
        self.backgroundImage.image = UIImage(named: "background.jpg")
        
        lblTitle.alpha = 0
        self.lblTitle.transform = CGAffineTransform(scaleX: 0, y: 0)
        btnTraining.alpha = 0
        btnNewGame.alpha = 0
        btnHighscores.alpha = 0
        btnDone.alpha = 0
        btnReturn.alpha = 0
        
        lblFirstPlayerNickname.alpha = 0
        inputFirstPlayerNickname.alpha = 0
        lblSecondPlayerNickname.alpha = 0
        inputSecondPlayerNickname.alpha = 0
        
        setupBtnCornersRadius()
    }
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func setupBtnCornersRadius() {
        btnTraining.layer.cornerRadius = 17
        btnTraining.clipsToBounds = true
        
        btnNewGame.layer.cornerRadius = 17
        btnNewGame.clipsToBounds = true
        
        btnHighscores.layer.cornerRadius = 17
        btnHighscores.clipsToBounds = true
        
        btnDone.layer.cornerRadius = 17
        btnDone.clipsToBounds = true
        
        btnReturn.layer.cornerRadius = 17
        btnReturn.clipsToBounds = true
        
        inputFirstPlayerNickname.layer.cornerRadius = 17
        inputFirstPlayerNickname.clipsToBounds = true
        
        inputSecondPlayerNickname.layer.cornerRadius = 17
        inputSecondPlayerNickname.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.lblTitle.transform = CGAffineTransform.identity
        self.btnTraining.transform = CGAffineTransform.identity
        self.btnNewGame.transform = CGAffineTransform.identity
        self.btnHighscores.transform = CGAffineTransform.identity
        self.btnDone.transform = CGAffineTransform.identity
        self.btnReturn.transform = CGAffineTransform.identity
        self.lblFirstPlayerNickname.transform = CGAffineTransform.identity
        self.inputFirstPlayerNickname.transform = CGAffineTransform.identity
        self.lblSecondPlayerNickname.transform = CGAffineTransform.identity
        self.inputSecondPlayerNickname.transform = CGAffineTransform.identity
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        animateEverythingIn()
    }
    
    func fadeOut() {
    
        UIView.animate(withDuration: 1, animations: {
            self.lblTitle.center.y -= self.view.bounds.height
            self.lblTitle.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.center.y -= self.view.bounds.height
            self.btnTraining.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.center.y -= self.view.bounds.height
            self.btnNewGame.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.center.y -= self.view.bounds.height
            self.btnHighscores.alpha = 0
        })
    }
    
    func fadeIn() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.lblTitle.center.y += self.view.bounds.height
            self.lblTitle.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.center.y += self.view.bounds.height
            self.btnTraining.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.center.y += self.view.bounds.height
            self.btnNewGame.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.center.y += self.view.bounds.height
            self.btnHighscores.alpha = 1
        })
    }
    
    func animateEverythingIn() {
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
    
    func animateSinglePlayerNicknameIn() {
        
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblFirstPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.lblFirstPlayerNickname.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputFirstPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.inputFirstPlayerNickname.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnDone.transform = CGAffineTransform(translationX: -100, y: 0)
            self.btnDone.alpha = 1
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.btnReturn.transform = CGAffineTransform(translationX: -100, y: 0)
            self.btnReturn.alpha = 1
        })
    }
    
    func animateTwoPlayerNicknameIn() {
        animateSinglePlayerNicknameIn()
        
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblSecondPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.lblSecondPlayerNickname.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputSecondPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.inputSecondPlayerNickname.alpha = 1
        })
    }
}
