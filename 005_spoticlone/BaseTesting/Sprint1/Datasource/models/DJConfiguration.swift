//
//  DJSettings.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

struct DJConfiguration {
    var option: Option = .Invalid
    let playbackInterval: Int = 5
    let playlistMessage: String
    var playlists: [Playlist] = []
    
    func readOption(_ inputText: String?) -> Option {
        let inputAsInt = Int(inputText ?? "") ?? -1
        guard let option = Option(input: inputAsInt) else {
            return .Invalid
        }
        
        return option
    }
}
