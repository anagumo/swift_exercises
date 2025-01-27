//
//  main.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 23/01/25.
//

/*
 TODOS:
 - main va al top del programa
 - el profe uso una cadena de múltiples líneas para el menú
 - no usa un sólo return
 - las funciones deben ser legos
 - tuplas en switch para comparar opciones vs un if
 - agregar un file para tests
 
 - en main sólo debe existir una función que ejecute el juego
 - no puedes acceder a todas las funciones de tu main entiy, asignar private
 - usa un isActive para validar si sigue activo
 */

import Foundation

/// Representation of the game result
enum GameState {
    case won
    case lost
    case tie
}

// MARK: Block functions

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
func readUserInput(_ inputText: String?) -> OptionType {
    let inputAsInt = Int(inputText ?? "") ?? -1
    guard let userOption = OptionType(input: inputAsInt) else {
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
func generateRandomOption() -> OptionType {
    let randomElement = (0...2).randomElement()
    
    guard let randomElement,
          let randomOption = OptionType(input: randomElement) else {
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
    /*var gameResult = GameResult(userOption: .Invalid,
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
    }*/
    let game = Game()
    game.play()
}

main()
