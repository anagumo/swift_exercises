//
//  main.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 23/01/25.
//

import Foundation

enum Option: String, CaseIterable {
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

// MARK: Block functions
/// Display options that can be selected to play with the computer
/// - returns: an string (`String`) that represent a list of options
/// - note: the function do not save the option selected by the user
///
/// # Implementation:
/// To display the options must iterate all  enum (`Option`) cases
///
/// Usage:
///```swift
///let optionsMessage = displayOptions()
///print(displayOptions)
///```
///
///Output:
///```
///Select an option
///0 - Rock
///1 - Paper
///2 - Scissors
///3 - Quit
///```

func displayOptions() -> String {
    var optionsMessage = "Select an option\n"
    for (index, option) in Option.allCases.enumerated() {
        optionsMessage = optionsMessage + "\(index) - \(option.rawValue)\n"
    }
    return optionsMessage
}

/// Handle user input
/// - parameters:
///     - inputText:  the text of type  (`String`) that user writes as input
/// - returns: an enum (`Option`) case that represent a selected option
/// - note: the function do not save the option selected by the user
///
/// # Implementation:
/// To handle the input create an enum (`Option`) using the rawValue
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
func readUserInput(_ inputText: String) -> Option? {
    guard let userOption = Option(input: Int(inputText) ?? -1) else {
        return nil
    }
    
    return userOption
}

// MARK: Main function
/// Implementation of the classic game "Rock, Paper or Scissor" where the user can play with the computer.
/// 2. Computer turns (create a random number generator, get the enum value, save option in a new variable)
/// 3. Evaluate both answers based on the game rules (evaluate both options and save the result in a new variable)
/// 4. Display results (display formatted string and the options game again)
/// 5. If user select exit, close the game (break the bucle and display a final message)
///
/// #Implementation
/// - The program should use a bucle to be able to play until the user exit
/// - Handle invalid output with clear messages
/// - Uses a random number generator to select the computer answer
func main() {}

main()
