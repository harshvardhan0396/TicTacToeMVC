//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harshvardhan on 13/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    var buttonArr =  [[UIButton]]()
    var flag = 9//To check the winner
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonArr = [[self.button00, self.button01,self.button02],[self.button10, self.button11, self.button12],[self.button20,self.button21,self.button22]]
    }
    var player = 1
    var count = 0
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        resetGame()
    }
    @IBAction func buttonPressed(_ sender: UIButton){
        if(player == 1 ){
            sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)
            player = 2
            sender.tag = 0
            sender.isEnabled = false
            count += 1
        }
        else {
            sender.setBackgroundImage(UIImage(named: "TTTX"), for: UIControl.State.normal)
            player = 1
            sender.tag = 1
            sender.isEnabled = false
            count += 1
        }
        //check winner
        if count >= 5 && count <= 9{
            getWinner()
        }
    }
    func getWinner() {
        //for checking all the vertical columns...
        for i in 0...2 {
            if(buttonArr[0][i].tag == buttonArr[1][i].tag && buttonArr[0][i].tag == buttonArr[2][i].tag && buttonArr[0][i].tag != 9){
                flag = buttonArr[0][i].tag
            }
        }
        //for checking all the horizontal rows...
        for i in 0...2 {
            if(buttonArr[i][0].tag == buttonArr[i][1].tag && buttonArr[i][0].tag == buttonArr[i][2].tag && buttonArr[i][0].tag != 9) {
                flag = buttonArr[i][0].tag
            }
        }
        // for checking all the diagonals
        if (buttonArr[0][0].tag == buttonArr[1][1].tag && buttonArr[1][1].tag == buttonArr[2][2].tag) {
            flag = buttonArr[1][1].tag
        }
        if (buttonArr[0][2].tag == buttonArr[1][1].tag && buttonArr[1][1].tag == buttonArr[2][0].tag) {
            flag = buttonArr[1][1].tag
        }
        //Display result...
        if(flag == 0) {
            updateAlertLabel(message: "Player 1 won...")
        }
        if(flag == 1){
            updateAlertLabel(message: "Player 2 won...")
        }
        //Draw condition
        if(count == 9 && flag == 9)
        {
            updateAlertLabel(message: "Draw...")
        }
    }
    func resetGame(){
        for i in 0...2 {
            for j in 0...2 {
                buttonArr[i][j].setBackgroundImage(nil, for: UIControl.State.normal)
                buttonArr[i][j].isEnabled = true
                buttonArr[i][j].tag = 9 //set all button tags to 9 to iniquely identify them
            }
        }
        count = 0
        player = 1
        flag = 9// any value which can be changed to 0 and 1 on winning
    }
    //alert box
    func updateAlertLabel(message: String){
        let alert = UIAlertController(title: "Result:", message: message,         preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
            self.resetGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
