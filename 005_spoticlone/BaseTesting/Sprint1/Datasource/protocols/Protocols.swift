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

protocol PlaylistUpdatable {
    mutating func add(_ song: Song)
    mutating func add(contentsOf songs: [Song])
    mutating func delete(_ song: Song)
    mutating func delete(contentsOf songs: [Song])
    func getCount() -> Int
    mutating func deleteAll()
    func shuffle() -> [Song]
    func order(by orderType: PlayMode) -> [Song]
}

protocol DJUpdatable {
    mutating func add(playlist: Playlist, completionHandler: () -> ())
}

protocol StyleUpdatable {
    mutating func add(tag: String)
}
