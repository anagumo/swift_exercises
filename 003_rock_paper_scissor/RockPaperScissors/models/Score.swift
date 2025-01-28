//
//  Score.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

enum ScoreType {
    case won
    case lost
    case tie
}

struct Score {
    var type: ScoreType
    
    mutating func evaluate(userOption: Option, computerOption: Option) {
        guard userOption != computerOption else {
            type = .tie
            return
        }
        
        switch (userOption, computerOption) {
        case (.Rock, .Scissors), (.Scissors, .Paper), (.Paper, .Rock):
            type = .won
        default:
            type = .lost
        }
    }
    
    func display(userOption: Option, computerOption: Option) -> String {
        var finalScore = "Has elegido \(userOption.rawValue)\nEl ordenador ha elegido \(computerOption.rawValue)\n"
        
        switch type {
        case .won:
            finalScore = finalScore + "Ganaste! \(userOption) vence a \(computerOption)\n"
        case .lost:
            finalScore = finalScore + "Perdiste! \(computerOption) vence a \(userOption)\n"
        case .tie:
            finalScore = finalScore + "Es un empate!\n"
        }
        
        return finalScore
    }
}
