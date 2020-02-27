//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Harshvardhan on 20/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

struct TicTacToeBrain{
    var count = 0
    var value = 0
    var player = 1
    var setImage = ""
    var buttonImage = ""
    var message = ""
    var flag = 2
    var winningCountPlayerOne = 0
    var winningCountPlayerTwo = 0
    var boardKey = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
    
    mutating func endGame(){
        winningCountPlayerOne = 0
        winningCountPlayerTwo = 0
    }
    
    mutating func restartState(){
        player = 1
        setImage = ""
        boardKey = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
        value = 0
        count = 0
        message = ""
    }
    
    mutating func getImageName(imageName: String){
        print(imageName)
        buttonImage = imageName
    }
    
    mutating func getButtonClicked(buttonTag: Int){
        if(player == 1 ){
            player = 2
            setImage = buttonImage
            value = 0
        }
        else{
            player = 1
            if(buttonImage == "TTTX"){
            setImage = "TTTO"
            }
            else{
                setImage = "TTTX"
            }
            value = 1
        }
        
        boardKey[buttonTag] = value
        count += 1
        gameLogic(boardKeyArray: boardKey)
    }
    
    func imageUpdate() -> String{
        return setImage
    }
    
    
    mutating func gameLogic(boardKeyArray : [Int]){
        for indexValue in stride(from: 0, to: 7, by: 3){
            //for horizontal
            if(boardKeyArray[indexValue] != -1 && boardKeyArray[indexValue] == boardKeyArray[indexValue+1] && boardKeyArray[indexValue] == boardKeyArray[indexValue+2]){
                flag = boardKeyArray[indexValue]
                break
            }
        }
        for indexValue in 0...2{
            if(boardKeyArray[indexValue] != -1 && boardKeyArray[indexValue] == boardKeyArray[indexValue+3] && boardKeyArray[indexValue] == boardKeyArray[indexValue+6]){
                flag = boardKeyArray[indexValue]
                break
            }
        }
        
        if(boardKeyArray[0] == boardKeyArray[4] && boardKeyArray[0] == boardKeyArray[8]){
            flag = boardKeyArray[0]
        }
        if(boardKeyArray[2] == boardKeyArray[4] && boardKeyArray[2] == boardKeyArray[6]){
            flag = boardKeyArray[2]
        }
        message = showResult(checkWinner: flag)
    }
    
    mutating func showResult(checkWinner : Int) -> String{
        if(checkWinner == 0){
           message = "Player 1 Won"
            winningCountPlayerOne += 1
            print("player 1 won times :",winningCountPlayerOne)
        }
        if(checkWinner == 1){
            message = "player 2 Won"
             winningCountPlayerTwo += 1
            print("player 2 won times :",winningCountPlayerTwo)
        }
        if(count == 9 && flag != 1 && flag != 0){
            message = "Draw"
        }
        return message
    }
    
}



