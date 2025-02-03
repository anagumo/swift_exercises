//
//  main.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 23/01/25.
//

import Foundation

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
    var game = Game()
    game.play()
}

main()
