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
        case 0:
            self = .Play
        case 1:
            self = .Create
        case 2:
            self = .Quit
        default:
            self = .Invalid
        }
    }
}

struct Menu {
    let options: [Option]
    
    func displayMainOptions() -> String {
        var textMenu = "🎧 Welcome to Spoticlone\n"
        for (index, option) in options.enumerated() {
            textMenu = textMenu + "\(index) - \(option.rawValue)\n"
        }
        
        return textMenu
    }
}
