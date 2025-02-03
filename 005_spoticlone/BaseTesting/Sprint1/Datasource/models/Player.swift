//
//  Player.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

enum PlayMode {
    case asc
    case des
    case shuffle
    case date
    case tonality
    case popularity
    case bmp
}

struct Player: PlayerTasks {
    private let songs = SongsLoader().songs
    private var djConfiguration = DJConfiguration(playlistMessage: "I love music more than I love people, ¡party is over!")
    private var playMode: PlayMode = .asc // Change the play mode manually
    
    mutating func open() {
        let menu = Menu(options: [.Playlist, .Style, .Discovery, .Quit])
        
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
            print("Select a playlist:")
            print(djConfiguration.displayPlaylists())
            // TODO: Validate user input
            playPlaylist(id: readLine() ?? "") {
                print("\(djConfiguration.playlistMessage)\n")
            }
        } else {
            createPlaylist()
        }
    }
    
    private func playPlaylist(id: String, completionHandler: () -> ()) {
        if let playlist = djConfiguration.get(playlist: id) {
            // TODO: Implement play mode selection
            playlist.order(by: playMode).forEach { song in
                print("Playing... \(song.basicInfo.title)")
                sleep(UInt32(djConfiguration.playbackInterval))
            }
            completionHandler()
        } else {
            print("Playlist not found")
        }
    }
    
    private mutating func createPlaylist() {
        print("Enter a name for your playlist: ")
        let playlistName = readLine() ?? ""
        
        // TODO: Validate if the playlist name exists
        var playlist = Playlist(id: "1", name: playlistName.isEmpty ? "untitled" : playlistName, songs: [])
        
        // Display songs to be selected by the user
        print(displayAvailableSongs())
        
        while playlist.songs.isEmpty {
            print("Select songs to add, ej: 5 1 10 4: ")
            let songsInput = readLine()?.components(separatedBy: .whitespaces)
            
            if let songsInput {
                playlist.add(contentsOf: songs.filter {
                    songsInput.contains($0.id)
                })
                djConfiguration.add(playlist: playlist) {
                    print("Playlist \(playlist.name) created with \(playlist.getCount()) songs\n")
                }
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
