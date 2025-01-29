//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct Player {
    // TODO: Use teacher Dataset
    private let songs = [Song(name: "Qué será de mi", artist: "Bratty"),
                         Song(name: "Quisiera no pensar", artist: "Kevin Kaarl"),
                         Song(name: "Crujidos", artist: "Nacho Vegas"),
                         Song(name: "A cualquier otra parte", artist: "Dorian"),
                         Song(name: "Prometo no olvidar", artist: "La Casa Azul")]
    
    func open() {
        let menu = Menu(options: [.Play, .Create, .Quit]) // TODO: Validate playlist array to avoid show play
        var djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
        
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Play:
                print("Displaying playlists...\n")
            case .Create:
                print("Creating playlist...\n")
            case .Quit:
                print("See you soon!...\n")
                return
            case .Invalid:
                print("Opción inválida\n")
            }
        }
    }
}
