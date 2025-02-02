//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct Player {
    let songs = SongsLoader().songs
    var djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
    
    mutating func open() {
        let menu = Menu(options: [.Playlist, .Style, .Discovery, .Quit]) // TODO: Validate playlist array to avoid show play
        
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Playlist:
                createPlaylist()
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
    
    mutating func createPlaylist() {
        if djConfiguration.playlists.isEmpty {
            print("Enter a name for your playlist: ")
            let playlistName = readLine() ?? ""
            
            // TODO: Validate if the playlist name exist
            var playlist = Playlist(id: 1, name: playlistName.isEmpty ? "untitled" : playlistName, songs: [], playMode: .asc)
            
            // Display songs to be selected by the user
            songs.forEach { song in
                print("\(song.id) - \(song.basicInfo.title)")
            }
            
            while playlist.songs.isEmpty {
                print("Select songs to add, ej: 5 1 10 4: ")
                let selectedSongs = readLine()?.components(separatedBy: .whitespaces)
                
                if let selectedSongs {
                    selectedSongs.forEach { selectedSong in
                        songs.forEach { song in
                            if song.id == selectedSong {
                                playlist.add(song)
                            }
                        }
                    }
                    djConfiguration.add(playlist: playlist)
                } else {
                    print("Select songs to add, ej: 5 1 10 4: ")
                }
            }
        } else {
            // TODO: Select a playlist
            djConfiguration.playlists.forEach { playlist in
                print("\(playlist.id) - \(playlist.name)")
            }
        }
    }
}
