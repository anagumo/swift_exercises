//
//  Player.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

enum PlayerType {
    case user
    case computer
}

struct Player: PlayerTasks {
    let type: PlayerType
    var option: Option
    var playerDelegate: PlayerDelegate?
    
    var continuePlaying: Bool {
        type == .user && option != .Quit
    }
    
    var isValidOption: Bool {
        type == .user && option != .Invalid
    }
    
    /// Handle user input
    /// - parameters:
    ///     - inputText:  the text of type  (`String`) that user writes as input
    /// - returns: an enum (`Option`) case that represent a selected option
    /// - note: the function do not save the option selected by the user
    ///
    /// # Implementation:
    /// To handle the input create an enum (`Option`) using its custom init
    ///
    /// Usage:
    ///```swift
    ///let userOption = readUserOption("1")
    ///print(userOption)
    ///```
    ///
    ///Output:
    ///```
    ///Optional(RockPaperScissors.Option.Paper)
    ///```
    mutating func generateOption(_ inputText: String?) {
        let inputAsInt = Int(inputText ?? "") ?? -1
        guard let option = Option(input: inputAsInt) else {
            playerDelegate?.displayGeneratedOption(.Invalid, playerType: .user)
            return
        }
        
        playerDelegate?.displayGeneratedOption(option, playerType: .user)
    }

    /// Generate a random option for computer
    /// - returns: an enum (`Option`) case that represent a random option
    /// - note: the function do not save the option selected by the computer
    ///
    /// # Implementation:
    /// To handle the input create an enum (`Option`) using its custom init
    ///
    /// Usage:
    ///```swift
    ///let randomOption = generateRandomOption()
    ///print(randomOption)
    ///```
    ///
    ///Output:
    ///```
    ///Optional(RockPaperScissors.Option.Scissors)
    ///```
    mutating func generateRandomOption() {
        let randomElement = (0...2).randomElement()
        
        guard let randomElement,
              let randomOption = Option(input: randomElement) else {
            playerDelegate?.displayGeneratedOption(.Invalid, playerType: .computer)
            return
        }
        
        playerDelegate?.displayGeneratedOption(randomOption, playerType: .computer)
    }
}
