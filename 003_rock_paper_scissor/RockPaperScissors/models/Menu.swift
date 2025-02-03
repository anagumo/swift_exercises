//
//  Menu.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

struct Menu: MenuTasks {
    let options: [Option]
    let menuDelegate: MenuDelegate?
    
    /// Display movements that can be selected to play with the computer
    /// - returns: an string (`String`) that represent a list of movements
    /// - note: the function do not save the movement selected by the user
    ///
    /// # Implementation:
    /// To display the options must iterate all  enum (`Option`) cases
    ///
    /// Usage:
    ///```swift
    ///let menuOptions = display()
    ///print(menuOptions)
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
    func getMenu() throws {
        var textMenu = "Select an option\n"
        
        guard !options.isEmpty else {
            throw GameError.EmptyMenu
        }
        
        for (index, option) in options.enumerated() {
            textMenu = textMenu + "\(index) - \(option.rawValue)\n"
        }
        menuDelegate?.displayMenu(textMenu)
    }
}
