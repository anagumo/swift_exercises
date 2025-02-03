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
    private let menu = Menu(options: [.Playlist, .Style, .Discovery, .Quit],
                            styles: [.Custom, .ChillVibes, .PartyStarter, .RockAnthems, .EmotionalTrip, .EnergyBoost, .EightyLovers])
    
    mutating func open() {
        while true {
            print(menu.displayMainOptions())
            djConfiguration.option = djConfiguration.readOption(readLine())
            
            switch djConfiguration.option {
            case .Playlist:
                selectPlaylist()
            case .Style:
                selectStyle()
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
            if let playlist = djConfiguration.getPlaylist(readLine() ?? "") {
                // TODO: Implement play mode selection
                play(songs: playlist.order(by: playMode), description: "\(playlist.name) - \(playlist.getCount())") {
                    print("\(djConfiguration.playlistMessage)\n")
                }
            } else {
                print("Playlist not found")
            }
        } else {
            createPlaylist()
        }
    }
    
    func play(songs: [Song], description: String, completion: () -> ()) {
        print("Playing songs from \(description)")
        songs.forEach { song in
            print("Playing... \(song.getTitle())")
            sleep(UInt32(djConfiguration.playInterval))
        }
        completion()
    }
    
    private mutating func createPlaylist() {
        print("Enter a name for your playlist: ")
        let playlistName = readLine() ?? ""
        
        // TODO: Validate if the playlist name exists
        var playlist = Playlist(id: "1", name: playlistName.isEmpty ? "untitled" : playlistName, songs: [])
        
        print(displayAvailableSongs())
        
        while playlist.songs.isEmpty {
            print("Select songs to add, ej: 5 1 10 4: ")
            let songsInput = readLine()?.components(separatedBy: .whitespaces)
            
            if let songsInput {
                playlist.add(contentsOf: songs.filter {
                    songsInput.contains($0.id)
                })
                djConfiguration.addPlaylist(playlist) {
                    print("Playlist \(playlist.name) created with \(playlist.getCount()) songs\n")
                }
            } else {
                print("Select songs to add, ej: 5 1 10 4: ")
            }
        }
    }
    
    private func displayAvailableSongs() -> String {
        songs.reduce("") {
            $0 + $1.getTitleEnumerated()
        }
    }
    
    private mutating func selectStyle() {
        print(menu.displayStyleOptions())
        
        let inputAsInt = Int(readLine() ?? "") ?? -1
        guard let styleType = StyleType(input: inputAsInt) else {
            print("Enter a valid option:")
            return
        }
        djConfiguration.style = DJStyle(name: styleType.rawValue, type: styleType, tags: styleType.tags)
        
        play(songs: filterSongs(by: styleType.tags), description: "\(styleType.rawValue)") {
            print("\(djConfiguration.playlistMessage)\n")
        }
    }
    
    func filterSongs(by tags: Set<String>) -> [Song] {
        songs.filter { song in
            song.metadata.tags.contains { tag in
                tags.contains(tag)
            }
        }
    }
}
