//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Harshvardhan on 20/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

struct TicTacToeBrain{
    var boardArray = [UIButton]()
    var player = 1
    var image = ""
    var buttonKey = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
    var value = 0
    var i = 0
    var count = 0
    var message = ""
    
    mutating func resetState(){
        player = 1
        image = ""
        buttonKey = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
        value = 0
        i = 0
        count = 0
        message = ""
    }
    mutating func getButtonClicked(buttonTag: Int){
        
        if(player == 1 ){
            player = 2
            image = "TTTO"
            value = 0
        }
        else{
            player = 1
            image = "TTTX"
            value = 1
        }
        
        buttonKey[buttonTag] = value
        //print(buttonKey)
        count += 1
        print(count)
        gameLogic(buttonKeyArray: buttonKey)
    }
    
    func imageUpdate() -> String{
        return image
    }
    var flag = 2
    mutating func gameLogic(buttonKeyArray : [Int]){
        for i in stride(from: 0, to: 7, by: 3){
            //for horizontal
            if(buttonKeyArray[i] != -1 && buttonKeyArray[i] == buttonKeyArray[i+1] && buttonKeyArray[i] == buttonKeyArray[i+2]){
                flag = buttonKeyArray[i]
                break
            }
        }
        for i in 0...2{
            if(buttonKeyArray[i] != -1 && buttonKeyArray[i] == buttonKeyArray[i+3] && buttonKeyArray[i] == buttonKeyArray[i+6]){
                flag = buttonKeyArray[i]
                break
            }
        }
        
        if(buttonKeyArray[0] == buttonKeyArray[4] && buttonKeyArray[0] == buttonKeyArray[8]){
            flag = buttonKeyArray[0]
        }
        if(buttonKeyArray[2] == buttonKeyArray[4] && buttonKeyArray[2] == buttonKeyArray[6]){
            flag = buttonKeyArray[2]
        }
        message = printMessage(showMessage: flag)
    }
    mutating func printMessage(showMessage : Int) -> String{
        if(showMessage == 0){
           message = "Player 1 Won"
        }
        if(showMessage == 1){
            message = "player 2 Won"
        }
        if(count == 9 && flag != 2){
            message = "Draw"
            print("Draw")
        }
        return message
    }
    
}



