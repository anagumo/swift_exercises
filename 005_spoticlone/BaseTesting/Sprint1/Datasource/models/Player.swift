//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

protocol PlayerTasks {
    mutating func open()
    mutating func selectPlaylist()
}

struct Player: PlayerTasks {
    let songs = SongsLoader().songs
    var djConfiguration = DJConfiguration(playlistMessage: "Amo la música más de lo que amo a la gente")
    
    mutating func open() {
        let menu = Menu(options: [.Playlist, .Style, .Discovery, .Quit]) // TODO: Validate playlist array to avoid show play
        
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Playlist:
                selectPlaylist()
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
    
    mutating func selectPlaylist() {
        if djConfiguration.hasPlaylists() {
            // TODO: Select a playlist
            print(djConfiguration.displayPlaylists())
        } else {
            createPlaylist()
        }
    }
    
    private mutating func createPlaylist() {
        print("Enter a name for your playlist: ")
        let playlistName = readLine() ?? ""
        
        // TODO: Validate if the playlist name exists
        var playlist = Playlist(id: 1, name: playlistName.isEmpty ? "untitled" : playlistName, songs: [], playMode: .asc)
        
        // Display songs to be selected by the user
        print(displayAvailableSongs())
        
        while playlist.songs.isEmpty {
            print("Select songs to add, ej: 5 1 10 4: ")
            let songsInput = readLine()?.components(separatedBy: .whitespaces)
            
            if let songsInput {
                playlist.add(contentsOf: songs.filter {
                    songsInput.contains($0.id)
                })
                djConfiguration.add(playlist: playlist)
            } else {
                print("Select songs to add, ej: 5 1 10 4: ")
            }
        }
    }
    
    private func displayAvailableSongs() -> String {
        songs.reduce("") {
            $0 + "\($1.id) - \($1.basicInfo.title)\n"
        }
    }
}
