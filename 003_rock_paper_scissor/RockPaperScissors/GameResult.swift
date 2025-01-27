//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 26/01/25.
//

import Foundation

struct GameResult {
    var userOption: OptionType
    let computerOption: OptionType
    var gameState: GameState
    
    var continuePlaying: Bool {
        userOption != .Quit
    }
    
    var isValidInput: Bool {
        userOption != .Invalid
    }
    
    mutating func play() {
        if userOption == computerOption {
            gameState = .tie
        } else if userOption == .Rock && computerOption == .Scissors
                    || userOption == .Scissors && computerOption == .Paper
                    || userOption == .Paper && computerOption == .Rock {
            gameState = .won
        } else {
            gameState = .lost
        }
    }
    
    func showResult() {
        print("Has elegido \(userOption.rawValue)")
        print("El ordenador ha elegido \(computerOption.rawValue)")
        
        switch gameState {
        case .won:
            print("Ganaste! \(userOption) vence a \(computerOption)\n")
        case .lost:
            print("Perdiste! \(computerOption) vence a \(userOption)\n")
        case .tie:
            print("Es un empate!\n")
        }
    }
}
