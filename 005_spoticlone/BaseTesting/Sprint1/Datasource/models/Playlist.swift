//
//  Playlist.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

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
    
    mutating func add(contentsOf songs: [Song]) -> [Song] {
        self.songs.append(contentsOf: songs)
        return songs.reversed()
    }
    
    mutating func delete(_ song: Song) -> [Song] {
        songs.removeAll {
            $0.id == song.id
        }
        return songs.reversed()
    }
    
    mutating func delete(contentsOf songs: [Song]) -> [Song] {
        songs.forEach { userSong in
            self.songs.removeAll { dataSetSong in
                userSong.id == dataSetSong.id
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
                $0.basicInfo.releaseDate > $1.basicInfo.releaseDate
            }
        case .tonality:
            return songs.sorted {
                $0.technicalInfo.key > $1.technicalInfo.key
            }
        case .popularity:
            return songs.sorted {
                $0.metadata.popularity > $1.metadata.popularity
            }
        case .bmp:
            return songs.sorted {
                $0.technicalInfo.bpm > $1.technicalInfo.bpm
            }
        }
    }
}
