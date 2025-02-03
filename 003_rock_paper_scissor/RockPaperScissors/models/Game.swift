//
//  Game.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

struct Game: GameTasks, MenuDelegate, ScoreDelegate {
    private var menu: Menu?
    private var userPlayer: Player
    private var computerPlayer: Player
    private var score: Score?
    
    init(menu: Menu? = nil, // I set nil because I need to set self as delegate
         userPlayer: Player = Player(type: .user, option: .Invalid),
         computerPlayer: Player = Player(type: .computer, option: .Invalid),
         score: Score? = nil) { // I set nil because I need to set self as delegate
        self.menu = menu
        self.userPlayer = userPlayer
        self.computerPlayer = computerPlayer
        self.score = score
    }
    
    mutating func play() {
        menu = Menu(options: [.Rock, .Paper, .Scissors, .Quit], menuDelegate: self)
        score = Score(type: .lost, scoreDelegate: self)
        
        while true {
            menu?.getMenu()
            userPlayer.option = userPlayer.generateOption(readLine())
            computerPlayer.option = computerPlayer.generateRandomOption()
            
            guard userPlayer.continuePlaying else {
                break
            }
            
            if userPlayer.isValidOption {
                score?.evaluate(userOption: userPlayer.option, computerOption: computerPlayer.option)
            } else {
                print("\nOpción inválida, selecciona una opción de la lista\n")
            }
        }
    }
    
    // MARK: Responsabilities delegated by Menu and Score entities
    func displayMenu(_ menu: String) {
        print(menu)
    }
    
    func displayScore(_ score: String) {
        print(score)
    }
}
