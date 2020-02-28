//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Harshvardhan on 20/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

struct TicTacToeBrain{
    var moveCount = 0
    var value = 0
    var player = 1
    var setImage = ""
    var buttonImage = ""
    var message = ""
    var flag = 2
    var winningCountPlayerOne = 0
    var winningCountPlayerTwo = 0
    var gameBoardState = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
    
    mutating func endGame(){
        winningCountPlayerOne = 0
        winningCountPlayerTwo = 0
    }
    
    mutating func restartState(){
        player = 1
        setImage = ""
        gameBoardState = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
        value = 0
        moveCount = 0
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
        
        gameBoardState[buttonTag] = value
        moveCount += 1
        gameLogic(gameBoardStateArray: gameBoardState)
    }
    
    func imageUpdate() -> String{
        return setImage
    }
    
    
    mutating func gameLogic(gameBoardStateArray : [Int]){
        for indexValue in stride(from: 0, to: 7, by: 3){
            //for horizontal
            if(gameBoardStateArray[indexValue] != -1 && gameBoardStateArray[indexValue] == gameBoardStateArray[indexValue+1] && gameBoardStateArray[indexValue] == gameBoardStateArray[indexValue+2]){
                flag = gameBoardStateArray[indexValue]
                break
            }
        }
        for indexValue in 0...2{
            if(gameBoardStateArray[indexValue] != -1 && gameBoardStateArray[indexValue] == gameBoardStateArray[indexValue+3] && gameBoardStateArray[indexValue] == gameBoardStateArray[indexValue+6]){
                flag = gameBoardStateArray[indexValue]
                break
            }
        }
        
        if(gameBoardStateArray[0] == gameBoardStateArray[4] && gameBoardStateArray[0] == gameBoardStateArray[8]){
            flag = gameBoardStateArray[0]
        }
        if(gameBoardStateArray[2] == gameBoardStateArray[4] && gameBoardStateArray[2] == gameBoardStateArray[6]){
            flag = gameBoardStateArray[2]
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
        if(moveCount == 9 && flag != 1 && flag != 0){
            message = "Draw"
        }
        return message
    }
    
}



