//
//  Game.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 27/01/25.
//

import Foundation

struct Game {
    let menu: Menu = Menu(options: [Option(type: .Rock),
                                    Option(type: .Paper),
                                    Option(type: .Scissors),
                                    Option(type: .Quit)])
    
    func play() {
        print(menu.displayOptions())
    }
}
