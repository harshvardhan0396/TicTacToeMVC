//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harshvardhan on 13/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var structObj = TicTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    var image = ""
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Select 0 or X", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "0", style: UIAlertAction.Style.default, handler: { _ in
            self.image = "TTTO"
            self.structObj.getImageName(imageName: self.image)
        }))
        alert.addAction(UIAlertAction(title: "X", style: UIAlertAction.Style.default, handler: { _ in
            self.image = "TTTX"
            self.structObj.getImageName(imageName: self.image)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func restartGame(_ sender: AnyObject) {
        self.loadView()
        structObj.restartState()
        
    }
    
    @IBAction func EndGame(_ sender: UIButton) {
        viewDidAppear(true)
        structObj.endGame()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        
        structObj.getButtonClicked(buttonTag: sender.tag)
        sender.isEnabled = false
        
        let imageName = structObj.imageUpdate()
          sender.setBackgroundImage(UIImage(named: imageName), for: UIControl.State.normal)
        
        let message = structObj.message
        if (message != ""){
            let alert = UIAlertController(title: "Result:", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in
                self.loadView()
                self.structObj.restartState()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
