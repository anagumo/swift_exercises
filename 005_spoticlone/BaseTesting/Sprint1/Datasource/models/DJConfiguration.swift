//
//  DJSettings.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct DJConfiguration: DJUpdatable {
    var option: Option = .Invalid
    let playbackInterval: Int = 5
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
    
    mutating func add(playlist: Playlist) {
        playlists.append(playlist)
    }
}
