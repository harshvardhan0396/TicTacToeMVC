//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Harshvardhan on 20/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
// build 2 march

import UIKit

struct PlayerDetails{
    var playerName = ""
    var room = ""
}

struct TicTacToeBrain{
    var moveCount = 0
    var currentPlayer = 1
    var playerOneImage = ""
    var playerTwoImage = ""
    var winningCountPlayerOne = 0
    var winningCountPlayerTwo = 0
    var gameBoardState = [0,0,0,0,0,0,0,0,0]
}

