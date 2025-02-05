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
    case Discover = "Discover new music"
    case Quit = "Quit player"
    case Invalid
    
    init?(input: Int) {
        switch input {
        case 0:
            self = .Playlist
        case 1:
            self = .Style
        case 2:
            self = .Discover
        case 3:
            self = .Quit
        default:
            self = .Invalid
        }
    }
}

struct Menu {
    let options: [Option]
    let styles: [StyleType]
    
    func displayMainOptions() -> String {
        var textMenu = "🎧 Welcome to Spoticlone\n"
        // FIXME: Research how to use a reduce with an enumerated
        options.enumerated().forEach { index, option in
            textMenu = textMenu + "\(index) - \(option.rawValue)\n"
        }
        
        return textMenu
    }
    
    func displayStyleOptions() -> String {
        var textMenu = "Select a style: \n"
        styles.enumerated().forEach { index, style in
            textMenu = textMenu + "\(index) - \(style.rawValue): \(style.description) \n"
        }
        
        return textMenu
    }
}
