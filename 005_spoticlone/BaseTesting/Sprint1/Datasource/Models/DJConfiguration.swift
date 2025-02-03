//
//  DJSettings.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct DJConfiguration: DJTasks {
    var option: Option = .Invalid
    let playInterval: Int = 5
    let playlistMessage: String
    var playlists: [Playlist] = []
    let style: DJStyle? = nil
    
    func readOption(_ inputText: String?) -> Option {
        let inputAsInt = Int(inputText ?? "") ?? -1
        guard let option = Option(input: inputAsInt) else {
            return .Invalid
        }
        
        return option
    }
    
    func hasPlaylists() -> Bool {
        !playlists.isEmpty
    }
    
    func displayPlaylists() -> String {
        playlists.reduce("") {
            $0 + "\($1.id) - \($1.name)\n"
        }
    }
    
    mutating func addPlaylist(_ playlist: Playlist, completionHandler: () -> ()) {
        playlists.append(playlist)
        completionHandler()
    }
    
    func getPlaylist(_ id: String) -> Playlist? {
        playlists.first {
            $0.id == id
        }
    }
}
