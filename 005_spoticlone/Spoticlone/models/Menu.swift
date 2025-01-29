//
//  Menu.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

enum Option: String {
    case Play = "Select a playlist"
    case Create = "Create a playlist"
    case Quit = "Quit player"
    case Invalid
    
    init?(input: Int) {
        switch input {
        case 1:
            self = .Play
        case 2:
            self = .Create
        case 3:
            self = .Quit
        default:
            self = .Invalid
        }
    }
}

struct Menu {
    let options: [Option]
    
    func displayMainOptions() -> String {
        var textMenu = "Select an option\n"
        for (index, option) in options.enumerated() {
            textMenu = textMenu + "\(index + 1) - \(option.rawValue)\n"
        }
        
        return textMenu
    }
}
