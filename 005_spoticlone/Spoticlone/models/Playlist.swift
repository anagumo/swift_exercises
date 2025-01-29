//
//  Playlist.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

enum PlaybackType {
    case ascending
    case descending
    case random
    case release // Ascending
    case tonality
    case popularity // Ascending, Descending
    case bmp // Descending
}

struct Playlist {
    let name: String
    let songs: [Song]
    let playbackMode: PlaybackType
}
