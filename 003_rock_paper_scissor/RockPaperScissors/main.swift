//
//  main.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 23/01/25.
//

import Foundation

// MARK: Block functions
enum Option: String, CaseIterable {
    case Rock
    case Paper
    case Scissors
    case Exit
}

func displayOptions() -> String {
    var optionsMessage = "Select an option\n"
    for (index, option) in Option.allCases.enumerated() {
        optionsMessage = optionsMessage + "\(index) - \(option.rawValue)\n"
    }
    return optionsMessage
}

// MARK: Main function that excutes the game
/// Implementation of the classic game "Rock, Paper or Scissor" where the user can play with the computer.
/// 1. Display options: rock, paper, scissor (read option, get enum value and save user option)
/// 2. Computer turns (create a random number generator, get the enum value, save option in a new variable)
/// 3. Evaluate both answers based on the game rules (evaluate both options and save the result in a new variable)
/// 4. Display results (display formatted string and the options game again)
/// 5. If user select exit, close the game (break the bucle and display a final message)
///
/// #Implementation
/// - The program should use a bucle to be able to play until the user exit
/// - Handle invalid output with clear messages
/// - Uses a random number generator to select the computer answer
func main() {
    print(displayOptions())
}

main()
