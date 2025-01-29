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
    
    func play() {
        let menu = """
            Bienvenido a spoticlone
            1. Reproducir playlist
            2. Crear playlist
            3. Salir
            """
        print(menu)
    }
}
