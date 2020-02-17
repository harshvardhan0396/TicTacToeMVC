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
    @IBOutlet weak var statusLabel: UILabel!
    var buttonArr =  [[UIButton]]()
    var flag = 9
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonArr = [[self.button00, self.button01,self.button02],[self.button10, self.button11, self.button12],[self.button20,self.button21,self.button22]]
        statusLabel.text = ""
    }
    var gameBrain = TicTacToeBrain()
    var player = 1
    var count = 0
    @IBAction func restartButton(_ sender: UIButton) {
        for i in 0...2 {
            for j in 0...2 {
            buttonArr[i][j].setBackgroundImage(nil, for: UIControl.State.normal)
            buttonArr[i][j].isEnabled = true
                statusLabel.text = ""
                count = 0
                player = 1
                flag = 9
                for i in 0...2{
                    for j in 0...2{
                        buttonArr[i][j].tag = 9
                    }
                }
            }
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton){
        if(player == 1 ){
            sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)
            print("player:\(player)")
            player = 2
            sender.tag = 0
            sender.isEnabled = false
            count += 1
            print("count:\(count)")
        }
        else {
            sender.setBackgroundImage(UIImage(named: "TTTX"), for: UIControl.State.normal)
            print("player:\(player)")
            player = 1
            sender.tag = 1
            sender.isEnabled = false
            count += 1
            print("count:\(count)")
        }
        //check winner
        if count >= 5 && count <= 9{
            getWinner()
        }
    }
    func getWinner() {
        //for vertical columns...
        for i in 0...2 {
            if(buttonArr[0][i].tag == buttonArr[1][i].tag && buttonArr[0][i].tag == buttonArr[2][i].tag){
                flag = buttonArr[0][i].tag
                print("flag for vertical:\(flag)")
            }
        }
        //for horizontal rows...
        for i in 0...2 {
            if(buttonArr[i][0].tag == buttonArr[i][1].tag && buttonArr[i][0].tag == buttonArr[i][2].tag) {
                flag = buttonArr[i][0].tag
                print("flag for horizontal:\(flag)")
            }
        }
        // for diagonals
        if (buttonArr[0][0].tag == buttonArr[1][1].tag && buttonArr[1][1].tag == buttonArr[2][2].tag) {
            flag = buttonArr[1][1].tag
        }
        if (buttonArr[0][2].tag == buttonArr[1][1].tag && buttonArr[1][1].tag == buttonArr[2][0].tag) {
            flag = buttonArr[1][1].tag
        }
        if(flag == 0) {
            statusLabel.text = "Player 1 won..."
        }
        if(flag == 1){
            statusLabel.text = "Player 2 won..."
        }
        if(count == 9 && flag == 9)
        {
            statusLabel.text = "Draw..."
        }
    }
}
