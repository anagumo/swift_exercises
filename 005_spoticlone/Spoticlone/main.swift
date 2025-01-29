//
//  main.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

func main() {
    let djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
    let spoticlonePlayer = Player(songs: [],
                                  djConfiguration: djConfiguration)
    spoticlonePlayer.open()
}

main()
