//
//  Menu.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

enum Option: String {
    case Playlist = "Select a playlist"
    case Style = "Select a style"
    case Discovery = "Discover new music"
    case Quit = "Quit player"
    case Invalid
    
    init?(input: Int) {
        switch input {
        case 0:
            self = .Playlist
        case 1:
            self = .Style
        case 2:
            self = .Discovery
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
        var textMenu = "🎧 Welcome to Spoticlone\n"
        for (index, option) in options.enumerated() {
            textMenu = textMenu + "\(index) - \(option.rawValue)\n"
        }
        
        return textMenu
    }
}
