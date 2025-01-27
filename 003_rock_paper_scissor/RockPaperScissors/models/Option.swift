//
//  Choice.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

/// Representation of and option to play
///
/// # Implementation
/// Use a custom init to handle the user input, add a case for an invalid input.
///
/// Usage:
///```swift
///let option = Option("1")
///print(option)
///```
///
///Output:
///```
///Optional(RockPaperScissors.OptionType.Paper)
///```
enum OptionType: String {
    case Rock
    case Paper
    case Scissors
    case Quit
    case Invalid
    
    init?(input: Int) {
        switch input {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        case 2:
            self = .Scissors
        case 3:
            self = .Quit
        default:
            self = .Invalid
        }
    }
}

struct Option {
    let type: OptionType
}
