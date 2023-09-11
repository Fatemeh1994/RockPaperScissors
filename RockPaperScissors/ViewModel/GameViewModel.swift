//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Fatemeh NajafiMoghadam on 9/10/23.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published private(set) var appChoice = Int.random(in: 0 ..< 3)
    @Published private(set) var playerWinLose = Bool.random()
    @Published private(set) var playerScore = 0
    @Published private(set) var playCount = 1
    @Published var gameOver = false

    private(set) var possibleMoves = [
        Constants.rock,
        Constants.paper,
        Constants.scissors
    ]
    
    var appMove: String {
        possibleMoves[appChoice]
    }
    
    func continueGame() {
        if playCount == 10 {
            gameOver = true
        } else {
            playCount += 1
            appChoice = Int.random(in: 0 ..< 3)
            playerWinLose = Bool.random()
        }
    }

    func resetGame() {
        appChoice = Int.random(in: 0 ..< 3)
        playerWinLose = Bool.random()
        playCount = 1
        playerScore = 0
    }
    
    var winOrLoseText: String {
        if playerWinLose == true {
            return "WIN!"
        } else {
            return "LOSE!"
        }
    }
    
    func playerChoice(_ item: Int) {
        //If player should try and WIN:
        if playerWinLose == true {
            //All the losing scenarios
            if item == appChoice {
                print("Lose - Items the same")
            } else if item == 2 && appChoice == 0 {
                print("Lose - Player chose Scissors, Siri chose Rock")
            } else if item == 0 && appChoice == 1 {
                print("Lose - Player chose Rock, Siri chose Paper")
            } else if item == 1 && appChoice == 2 {
                print("Lose - Player chose Paper, Siri chose Scissors")
            } else {
                print("Win! Add Points")
                playerScore += 1
            }
        } else {
            //If player should try and LOSE:
                //All the winning scenarios (because copy/paste from above was easy xD)
            if item == appChoice {
                print("Win - Items the same")
                playerScore += 1
            } else if item == 2 && appChoice == 0 {
                print("Win - Player chose Scissors, Siri chose Rock")
                playerScore += 1
            } else if item == 0 && appChoice == 1 {
                print("Win - Player chose Rock, Siri chose Paper")
                playerScore += 1
            } else if item == 1 && appChoice == 2 {
                print("Win - Player chose Paper, Siri chose Scissors")
                playerScore += 1
            } else {
                print("Lose - No Points")
            }
        }
    }
}
