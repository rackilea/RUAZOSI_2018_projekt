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
    
    
    var firstPlayerNicknameShowing: Bool = false
    var secondPlayerNicknameShowing: Bool = false
    
    @IBAction func startTraining(_ sender: UIButton) {
        hideHomeScreen()
        animateFirstPlayerNicknameIn()
        showDoneAndReturnButtons()
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        hideHomeScreen()
        animateFirstPlayerNicknameIn()
        animateSecondPlayerNicknameIn()
        showDoneAndReturnButtons()
    }
    
    @IBAction func viewHighscores(_ sender: UIButton) {
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
        self.navigationController?.pushViewController(vc, animated: true)
        inputFirstPlayerNickname.text = ""
        inputSecondPlayerNickname.text = ""
    }
    
    @IBAction func returnToHomeState(_ sender: UIButton) {
        hideDoneAndReturnButtons()
        showHomeScreen()
        if (self.firstPlayerNicknameShowing) {
            animateFirstPlayerNicknameOut()
        }
        
        if (self.secondPlayerNicknameShowing) {
            animateSecondPlayerNicknameOut()
        }
        
        inputFirstPlayerNickname.text = ""
        inputSecondPlayerNickname.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImage.image = UIImage(named: "background.jpg")
        setupBtnCornersRadius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showHomeScreen()
        hideButtons()
        hideDoneAndReturnButtons()
        hideUserNameInput()
        
        animateFirstPlayerNicknameOut()
        animateSecondPlayerNicknameOut()
    }
    
    func showUsernameInput() -> Void {
        lblFirstPlayerNickname.alpha = 1
        inputFirstPlayerNickname.alpha = 1
        lblSecondPlayerNickname.alpha = 1
        inputSecondPlayerNickname.alpha = 1
    }
    
    func hideUserNameInput() -> Void {
        lblFirstPlayerNickname.alpha = 0
        inputFirstPlayerNickname.alpha = 0
        lblSecondPlayerNickname.alpha = 0
        inputSecondPlayerNickname.alpha = 0
    }
    
    func hideButtons() -> Void {
        btnReturn.alpha = 0
        btnDone.alpha = 0
    }
    
    func showHomeScreen() -> Void {
        UIView.animate(withDuration: 1, animations: {
            self.lblTitle.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.lblTitle.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.transform = CGAffineTransform(translationX: 500, y: 0)
            self.btnTraining.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.transform = CGAffineTransform(translationX: 500, y: 0)
            self.btnNewGame.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.transform = CGAffineTransform(translationX: 500, y: 0)
            self.btnHighscores.alpha = 1
        })
    }
    
    func hideHomeScreen() -> Void {
        UIView.animate(withDuration: 1, animations: {
            self.lblTitle.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.lblTitle.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.btnTraining.transform = CGAffineTransform(translationX: -500, y: 0)
            self.btnTraining.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.btnNewGame.transform = CGAffineTransform(translationX: -500, y: 0)
            self.btnNewGame.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnHighscores.transform = CGAffineTransform(translationX: -500, y: 0)
            self.btnHighscores.alpha = 1
        })
    }
    
    func showDoneAndReturnButtons() -> Void {
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnDone.transform = CGAffineTransform(translationX: -100, y: 0)
            self.btnDone.alpha = 1
        })
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.btnReturn.transform = CGAffineTransform(translationX: -100, y: 0)
            self.btnReturn.alpha = 1
        })
    }
    
    func hideDoneAndReturnButtons() -> Void {
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.btnDone.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnDone.alpha = 0
        })
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.btnReturn.transform = CGAffineTransform(translationX: 100, y: 0)
            self.btnReturn.alpha = 0
        })
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
    
    func animateFirstPlayerNicknameIn() {
        firstPlayerNicknameShowing = true
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblFirstPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.lblFirstPlayerNickname.alpha = 1
        })
        
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputFirstPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.inputFirstPlayerNickname.alpha = 1
        })
    }
    
    
    func animateFirstPlayerNicknameOut() {
        firstPlayerNicknameShowing = false

        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblFirstPlayerNickname.transform = CGAffineTransform(translationX: +100, y: 0)
            self.lblFirstPlayerNickname.alpha = 0
        })
        
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputFirstPlayerNickname.transform = CGAffineTransform(translationX: +100, y: 0)
            self.inputFirstPlayerNickname.alpha = 0
        })
    }
    
    func animateSecondPlayerNicknameIn() {
        secondPlayerNicknameShowing = true
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblSecondPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.lblSecondPlayerNickname.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputSecondPlayerNickname.transform = CGAffineTransform(translationX: -100, y: 0)
            self.inputSecondPlayerNickname.alpha = 1
        })
    }
    
    func animateSecondPlayerNicknameOut() {
        secondPlayerNicknameShowing = false
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.lblSecondPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
            self.lblSecondPlayerNickname.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.inputSecondPlayerNickname.transform = CGAffineTransform(translationX: 100, y: 0)
            self.inputSecondPlayerNickname.alpha = 0
        })
    }
}
