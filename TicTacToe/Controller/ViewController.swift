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
    
    func currentPlayer() -> Int{
        let player = structObj.currentPlayer
        return player
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Select 0 or X", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "0", style: UIAlertAction.Style.default, handler: { _ in
            self.structObj.playerOneImage = "TTTO"
            self.structObj.playerTwoImage =  "TTTX"
        }))
        alert.addAction(UIAlertAction(title: "X", style: UIAlertAction.Style.default, handler: { _ in
            self.structObj.playerOneImage = "TTTX"
            self.structObj.playerTwoImage =  "TTTO"
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func restartGame(){
        self.loadView()
        structObj.currentPlayer = 1
        structObj.moveCount = 0
        structObj.gameBoardState = [0,0,0,0,0,0,0,0,0]
    }
    
    @IBAction func restartGame(_ sender: AnyObject) {
        restartGame()
    }
    
    @IBAction func EndGame(_ sender: AnyObject) {
        restartGame()
        viewDidAppear(true)
        structObj.playerOneImage = ""
        structObj.playerTwoImage = ""
        structObj.winningCountPlayerOne = 0
        structObj.winningCountPlayerTwo = 0
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        structObj.gameBoardState[sender.tag] = currentPlayer()
        sender.isEnabled = false
        
        if (structObj.currentPlayer == 1){
            sender.setBackgroundImage(UIImage(named: structObj.playerOneImage), for: UIControl.State.normal)
            structObj.currentPlayer = 2
        }
        else{
            sender.setBackgroundImage(UIImage(named: structObj.playerTwoImage), for: UIControl.State.normal)
            structObj.currentPlayer = 1
        }
        structObj.moveCount += 1
        gameLogic()
    }
    
    func gameLogic(){
        var flag = 0
        
        for indexValue in stride(from: 0, to: 7, by: 3){
            //for horizontal
            if(structObj.gameBoardState[indexValue] != 0
                && (structObj.gameBoardState[indexValue] == structObj.gameBoardState[indexValue+1])
                && (structObj.gameBoardState[indexValue] == structObj.gameBoardState[indexValue+2])
            )
            {
                flag = structObj.gameBoardState[indexValue]
                break
            }
        }
        //for vertical
        for indexValue in 0...2{
            if(structObj.gameBoardState[indexValue] != 0 && structObj.gameBoardState[indexValue] == structObj.gameBoardState[indexValue+3] && structObj.gameBoardState[indexValue] == structObj.gameBoardState[indexValue+6]){
                flag = structObj.gameBoardState[indexValue]
                break
            }
        }
        
        if(structObj.gameBoardState[0] == structObj.gameBoardState[4] && structObj.gameBoardState[0] == structObj.gameBoardState[8]){
            flag = structObj.gameBoardState[0]
        }
        
        if(structObj.gameBoardState[2] == structObj.gameBoardState[4] && structObj.gameBoardState[2] == structObj.gameBoardState[6]){
            flag = structObj.gameBoardState[2]
        }
        
        if(flag != 1 && flag != 2 && structObj.moveCount == 9){
            showResult(message: "Draw")
        }
        else{
            checkWinner(flagValue: flag)
            flag = 0
        }
    }
    
    func checkWinner(flagValue : Int){
        var message = ""
        if(flagValue == 1){
           message = "Player 1 Won"
            structObj.winningCountPlayerOne += 1
            print("player 1 won times :",structObj.winningCountPlayerOne)
        }
        if(flagValue == 2){
            message = "player 2 Won"
            structObj.winningCountPlayerTwo += 1
            print("player 2 won times :",structObj.winningCountPlayerTwo)
        }
        if (message != ""){
            showResult(message: message)
        }
    }
    
    func showResult(message : String){
        let alert = UIAlertController(title: "Result:", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in
            self.restartGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
