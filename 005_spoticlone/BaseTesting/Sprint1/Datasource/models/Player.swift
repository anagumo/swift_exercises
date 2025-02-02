//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct Player {
    let songs = SongsLoader().songs
    
    func open() {
        let menu = Menu(options: [.Playlist, .Style, .Discovery, .Quit]) // TODO: Validate playlist array to avoid show play
        var djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
        
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Playlist:
                print("Select a playlist...\n")
            case .Style:
                print("Select a style...")
            case .Discovery:
                print("Discover new music...")
            case .Quit:
                print("See you soon!...\n")
                return
            case .Invalid:
                print("Invalid option\n")
            }
        }
    }
}
