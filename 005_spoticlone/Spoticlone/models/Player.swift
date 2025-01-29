//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct Player {
    let songs: [Song]
    let playlists: [Playlist] = []
    let djConfiguration: DJConfiguration
    
    func open() {
        let menu = Menu(options: [.Play, .Create, .Quit])
        print(menu.displayMainOptions())
    }
}
