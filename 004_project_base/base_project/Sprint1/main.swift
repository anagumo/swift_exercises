//
//  main.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

let logger = Logger(subsystem: "Sprint1", category: "main")

// MARK: - Main
func main() {
    
    let songs = SongsLoader().songs
    let filterByArtist = filterBy(artist: "Tina Turner", songs: songs)
    print("Total songs: \(songs.count), Tina Turner songs: \(filterByArtist.count)")
    filterByArtist.forEach { song in
        print("La canción \(song.basicInfo.title) es de \(song.basicInfo.artist)")
    }
    
    print("__________________________________________")
    let filteredSongs = filterByDuration(minutes: 3, songs: songs)
    print("Total songs: \(songs.count), 3min songs: \(filteredSongs.count)")
    filteredSongs.forEach { song in
        print("La canción \(song.basicInfo.title) dura \(song.basicInfo.durationMs) ms o bien \(song.toMinutes()) minutes")
    }
    
    print("__________________________________________")
    let totalDuration = getTotalDuration(songs: songs)
    print("La duración del cátalogo es de \(totalDuration) minutos")
    
    print("__________________________________________")
    guard let (album, songsCount) = getAlbumWithMoreSongs(songs: songs) else {
        return
    }
    print( "The album with more songs is: \(album) with \(songsCount) songs")
    
    print("__________________________________________")
    let tonalities = validateTonalities(songs: songs)
    if tonalities.isEmpty {
        print("The catalogue has all tonalities")
    } else {
        print("The missing keys are: \(tonalities)")
    }
}

main()

func filterBy(artist: String, songs: [Song]) -> [Song] {
    songs.filter { $0.isBy(artist: artist) }
}

func filterByDuration(minutes: Int, songs: [Song]) -> [Song] {
    songs.filter { $0.isGreaterThan(minutes: minutes) }
}

func getTotalDuration(songs: [Song]) -> Double {
    songs.reduce(0, { $0 + $1.toMinutes() })
}

func getAlbumWithMoreSongs(songs: [Song]) -> (String, Int)? {
    var albumes: [String: Int] = [:]
    songs.forEach { song in
        guard let oldCount = albumes[song.basicInfo.album] else {
            albumes[song.basicInfo.album] = 1
            return
        }
        albumes[song.basicInfo.album] = oldCount + 1
    }
    
    let firstAlbum = albumes
        .sorted(by: { $0.value > $1.value })
        .prefix(1).first
    return firstAlbum
}

func validateTonalities(songs: [Song]) -> Set<String> {
    let tonalities = [
        "C": ["G", "F", "Am"],
        "C#": ["G#", "F#", "A#m"],
        "Db": ["Ab", "Gb", "Bbm"],
        "D": ["A", "G", "Bm"],
        "D#": ["A#", "A", "Cm"],
        "Eb": ["Bb", "Ab", "Cm"],
        "E": ["B", "A", "C#m"],
        "F": ["C", "Bb", "Dm"],
        "F#": ["C#", "B", "D#m"],
        "Gb": ["Db", "B", "Ebm"],
        "G": ["D", "C", "Em"],
        "G#": ["D#", "D", "Fm"],
        "Ab": ["Eb", "Db", "Cm"],
        "A": ["E", "D", "F#m"],
        "A#": ["F", "E", "Gm"],
        "Bb": ["F", "Eb", "Gm"],
        "B": ["F#", "E", "G#m"]
    ]
    
    var tonalitiesByAlbum = Set<String>()
    songs.forEach { song in
        tonalities.forEach { tonality in
            guard song.technicalInfo.key == tonality.key else {
                return
            }
            tonalitiesByAlbum.insert(tonality.key)
        }
    }
    
    var missingTonalities = Set<String>()
    tonalities.forEach { tonality in
        guard !tonalitiesByAlbum.contains(tonality.key) else {
            return
        }
        missingTonalities.insert(tonality.key)
    }
    
    return missingTonalities
}
