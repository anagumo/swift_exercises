//
//  Protocols.swift
//  Sprint1
//
//  Created by Ariana Rodríguez on 31/01/25.
//

import Foundation

protocol PlaylistUpdatable {
    mutating func add(_ song: Song) -> [Song]
    mutating func add(contentsOf songs: [Song]) -> [Song]
    mutating func delete(_ song: Song) -> [Song]
    mutating func delete(contentsOf songs: [Song]) -> [Song]
    func getCount() -> Int
    mutating func deleteAll()
    func shuffle() -> [Song]
    func play(_ orderType: PlayMode) -> [Song]
}

protocol StyleUpdatable {
    mutating func add(tag: String)
}
