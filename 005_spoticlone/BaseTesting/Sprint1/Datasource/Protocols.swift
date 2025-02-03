//
//  Protocols.swift
//  Sprint1
//
//  Created by Ariana Rodríguez on 31/01/25.
//

import Foundation

protocol PlayerTasks {
    mutating func open()
    mutating func selectPlaylist()
}

protocol PlaylistTasks {
    mutating func add(_ song: Song)
    mutating func add(contentsOf songs: [Song])
    mutating func delete(_ song: Song)
    mutating func delete(contentsOf songs: [Song])
    mutating func deleteAll()
    func getCount() -> Int
    func shuffle() -> [Song]
    func order(by orderType: PlayMode) -> [Song]
}

protocol DJTasks {
    func displayPlaylists() -> String
    mutating func addPlaylist(_ playlist: Playlist, completionHandler: () -> ())
    func getPlaylist(_ id: String) -> Playlist?
}

protocol StyleTasks {
    mutating func addTag(_ tag: String)
}
