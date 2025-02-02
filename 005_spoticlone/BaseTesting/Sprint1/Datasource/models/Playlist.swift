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
        songs.forEach { song in
            self.songs.removeAll { dataSetSong in
                song.id == dataSetSong.id
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
        var orderedSongs: [Song] = []
        
        switch orderType {
        case .asc:
            orderedSongs = songs.reversed()
        case .des:
            orderedSongs = songs
        case .shuffle:
            orderedSongs = songs.shuffled()
        case .date:
            orderedSongs = songs.sorted {
                $0.basicInfo.releaseDate > $1.basicInfo.releaseDate
            }
        case .tonality:
            var tonalities: [String: [Song]] = [:]
            songs.forEach { song in
                if var oldSongs = tonalities[song.technicalInfo.key] {
                    oldSongs.append(song)
                    tonalities[song.technicalInfo.key] = oldSongs
                } else {
                    tonalities[song.technicalInfo.key] = []
                }
            }
            
            tonalities.forEach { tonality in
                orderedSongs.append(contentsOf: tonality.value)
            } // TODO: Sort by C to A
        case .popularity:
            orderedSongs = songs.sorted {
                $0.metadata.popularity > $1.metadata.popularity
            }
        case .bmp:
            orderedSongs = songs.sorted {
                $0.technicalInfo.bpm > $1.technicalInfo.bpm
            }
        }
        
        return orderedSongs // Based on Dijstra I just use one return
    }
}
