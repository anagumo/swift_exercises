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
        let menu = Menu(options: [.Play, .Create, .Quit]) // TODO: Validate playlist array to avoid show play
        var djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
        
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Play:
                print("Displaying playlists...\n")
            case .Create:
                let playlist = createPlaylist()
                djConfiguration.playlists.append(playlist)
            case .Quit:
                print("See you soon!...\n")
                return
            case .Invalid:
                print("Opción inválida\n")
            }
        }
        
        func createPlaylist() -> Playlist {
            print("Enter the name of your playlist:")
            let name = readLine()
            
            print("\nWhich song(s) do you want to add:")
            songs.enumerated().forEach { (index, song) in
                print("\(index). \(song.basicInfo.title)")
            }
            print("Enter songs, ej: 3,5,1\n")
            
            let playlist = Playlist(name: name ?? "", songs: songs, playMode: .asc)
            
            print("The playlist \(name) was created with \(songs.count) songs")
            playlist.songs.enumerated().forEach { (index,song) in
                print("\(index). \(song.basicInfo.title) by \(song.basicInfo.artist)")
            }
            return playlist
        }
    }
}
