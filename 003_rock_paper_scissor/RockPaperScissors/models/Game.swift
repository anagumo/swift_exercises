//
//  Game.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

struct Game: GameTasks, MenuDelegate, PlayerDelegate, ScoreDelegate {
    private var userPlayer = Player(type: .user, option: .Invalid)
    private var computerPlayer = Player(type: .computer, option: .Invalid)
    
    mutating func play() {
        let menu: Menu = Menu(options: [.Rock, .Paper, .Scissors, .Quit], menuDelegate: self)
        var score = Score(type: .lost, scoreDelegate: self)
        
        while true {
            menu.displayOptions()
            userPlayer.playerDelegate = self
            computerPlayer.playerDelegate = self
            userPlayer.generateOption(readLine())
            computerPlayer.generateRandomOption()
            
            guard userPlayer.continuePlaying else {
                break
            }
            
            if userPlayer.isValidOption {
                score.evaluate(userOption: userPlayer.option, computerOption: computerPlayer.option)
                score.display(userOption: userPlayer.option, computerOption: computerPlayer.option)
            } else {
                print("\nOpción inválida, selecciona una opción de la lista\n")
            }
        }
    }
    
    func displayMenu(textMenu: String) {
        print(textMenu)
    }
    
    mutating func displayGeneratedOption(_ option: Option, playerType: PlayerType) {
        if playerType == .user {
            userPlayer.option = option
        } else {
            computerPlayer.option = option
        }
    }
    
    func displayScore(finalScore: String) {
        print(finalScore)
    }
}
