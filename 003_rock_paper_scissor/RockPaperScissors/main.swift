//
//  main.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 23/01/25.
//

import Foundation

/// Representation of and option to play
///
/// # Implementation
/// Use a custom init to handle the user input, add a case for an invalid input.
///
/// Usage:
///```swift
///let userOption = Option("1")
///print(userOption)
///```
///
///Output:
///```
///Optional(RockPaperScissors.Option.Paper)
///```
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

/// Representation of the game result
enum GameState {
    case won
    case lost
    case tie
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
        guard option != Option.Invalid else {
            return optionsMessage
        }
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
func readUserInput(_ inputText: String?) -> Option {
    let inputAsInt = Int(inputText ?? "") ?? -1
    guard let userOption = Option(input: inputAsInt) else {
        return .Invalid
    }
    
    return userOption
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
func generateRandomOption() -> Option {
    let randomElement = (0...2).randomElement()
    
    guard let randomElement,
          let randomOption = Option(input: randomElement) else {
        return .Invalid
    }
    return randomOption
}

// MARK: Main function
/// Implementation of the classic game "Rock, Paper or Scissor" where the user can play with the computer.
///
/// # Implementation
///  - The program should use a bucle to be able to play until the user exit
///  - Handle invalid output with clear messages
///  - Uses a random number generator to select the computer answer
///
/// Usage:
///```swift
///main()
///```
///
/// Output:
///```
///Select an option
///0 - Rock
///1 - Paper
///2 - Scissors
///3 - Quit
///1
///Has elegido Paper
///El ordenador ha elegido Rock
///Ganaste! Paper vence a Rock
///```
func main() {
    var gameResult = GameResult(userOption: .Invalid,
                                computerOption: generateRandomOption(),
                                gameState: .lost)
    
    while true {
        print(displayOptions())
        gameResult.userOption = readUserInput(readLine())
        
        guard gameResult.continuePlaying else {
            break
        }
        
        if gameResult.isValidInput {
            gameResult.play()
            gameResult.showResult()
        } else {
            print("\nOpción inválida, selecciona una opción de la lista\n")
        }
    }
}

main()
