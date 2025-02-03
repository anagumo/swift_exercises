//
//  Playlist.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/01/25.
//

import Foundation

enum PlayMode {
    case asc
    case des
    case shuffle
    case date
    case tonality
    case popularity
    case bmp
}

struct Playlist: PlaylistUpdatable {
    var id: String
    var name: String
    var songs: [Song]
    let playMode: PlayMode
    
    mutating func add(_ song: Song) {
        songs.append(song)
    }
    
    mutating func add(contentsOf songs: [Song]) {
        self.songs.append(contentsOf: songs)
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
        order( by: .shuffle)
    }
    
    func order(by playMode: PlayMode) -> [Song] {
        var orderedSongs: [Song] = []
        
        switch playMode {
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
    
    func filter(by style: DJStyle) -> [Song] {
        songs.filter {
            Set($0.metadata.tags) == style.tags
        }
    }
}
