//
//  Game.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

struct Game {
    private let menu: Menu = Menu(options: [.Rock, .Paper, .Scissors, .Quit])
    
    func play() {
        var userPlayer = Player(type: .user, option: .Invalid)
        var computerPlayer = Player(type: .computer, option: .Invalid)
        var score = Score(type: .lost)
        
        while true {
            print(menu.displayOptions())
            userPlayer.option = userPlayer.generateUserOption(readLine())
            computerPlayer.option = computerPlayer.generateRandomOption()
            
            guard userPlayer.continuePlaying else {
                break
            }
            
            if userPlayer.isValidOption {
                score.evaluate(userOption: userPlayer.option, computerOption: computerPlayer.option)
                print(score.display(userOption: userPlayer.option, computerOption: computerPlayer.option))
            } else {
                print("\nOpción inválida, selecciona una opción de la lista\n")
            }
        }
    }
}
