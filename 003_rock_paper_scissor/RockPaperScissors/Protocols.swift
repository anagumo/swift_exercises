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

protocol MenuTasks {
    func getMenu() throws
}

protocol MenuDelegate {
    func displayMenu(_ menu: String)
}

protocol PlayerTasks {
    mutating func generateOption(_ inputText: String?) -> Option
    mutating func generateRandomOption() -> Option
    func isValidOption() throws
}

protocol ScoreTasks {
    mutating func evaluate(userOption: Option, computerOption: Option)
}

protocol ScoreDelegate {
    func displayScore(_ score: String)
}
