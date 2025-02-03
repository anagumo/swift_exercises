//
//  Protocols.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 03/02/25.
//

import Foundation

protocol GameTasks {
    mutating func play()
}

protocol MenuDelegate {
    func displayMenu(textMenu: String)
}

protocol PlayerTasks {
    mutating func generateOption(_ inputText: String?)
    mutating func generateRandomOption()
}

protocol PlayerDelegate {
    mutating func displayGeneratedOption(_ option: Option, playerType: PlayerType)
}

protocol ScoreTasks {
    mutating func evaluate(userOption: Option, computerOption: Option)
    func display(userOption: Option, computerOption: Option)
}

protocol ScoreDelegate {
    func displayScore(finalScore: String)
}
