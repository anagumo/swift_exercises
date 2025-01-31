//
//  Playlist.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

protocol PlaylistUpdatable {
    mutating func add(_ song: Song) -> [Song]
    mutating func add(_ songs: [Song]) -> [Song]
    mutating func delete(_ song: Song) -> [Song]
    mutating func delete(_ songs: [Song]) -> [Song]
    func getCount() -> Int
    mutating func deleteAll()
    func shuffle() -> [Song]
    func orderBy(_ orderType: OrderType) -> [Song]
}

enum OrderType {
    case asc
    case des
    case shuffle
    case date
    case tonality
    case popularity
    case bmp
}

struct Playlist: PlaylistUpdatable {
    let name: String
    var songs: [Song]
    let playbackMode: OrderType
    
    mutating func add(_ song: Song) -> [Song] {
        songs.append(song)
        return songs.reversed()
    }
    
    mutating func add(_ songs: [Song]) -> [Song] {
        self.songs.append(contentsOf: songs)
        return songs.reversed()
    }
    
    mutating func delete(_ song: Song) -> [Song] {
        songs.removeAll {
            $0.name == song.name
        }
        return songs.reversed()
    }
    
    mutating func delete(_ songs: [Song]) -> [Song] {
        songs.forEach { userSong in
            self.songs.removeAll { dataSetSong in
                userSong.name == dataSetSong.name
            }
        }
        return self.songs.reversed()
    }
    
    func getCount() -> Int {
        songs.count
    }
    
    mutating func deleteAll() {
        songs.removeAll()
    }
    
    func shuffle() -> [Song] {
        orderBy( .shuffle)
    }
    
    func orderBy(_ orderType: OrderType) -> [Song] {
        switch orderType {
        case .asc:
            return songs.reversed()
        case .des:
            return songs
        case .shuffle:
            return songs.shuffled()
        case .date:
            return songs.sorted {
                $0.artist > $1.artist
            }
        case .tonality:
            return songs.sorted {
                $0.artist > $1.artist
            }
        case .popularity:
            return songs.sorted {
                $0.artist > $1.artist
            }
        case .bmp:
            return songs.sorted {
                $0.artist > $1.artist
            }
        }
    }
}
