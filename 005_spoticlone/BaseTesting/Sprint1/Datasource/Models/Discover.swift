//
//  Discover.swift
//  Sprint1
//
//  Created by Ariana Rodríguez on 05/02/25.
//

import Foundation

// To practice and play with optionals
struct Discover {
    let firstSong: Song?
    let secondSong: Song?
    var matchingPoints: Double
    
    init(firstSong: Song?, secondSong: Song?, matchingPoints: Double = 0) {
        self.firstSong = firstSong
        self.secondSong = secondSong
        self.matchingPoints = matchingPoints
    }
    
    mutating func calculateMatchingPoints() {
        matchingPoints = matchingPoints + getGenreMatching()
        matchingPoints = matchingPoints + getBPMMatching()
        matchingPoints = matchingPoints + getTagsMatching()
        matchingPoints = matchingPoints + getTonalityMatching()
        matchingPoints = matchingPoints + getPopularityMatching()
    }
    
    func displayMatchingPoints() -> String {
        guard let firstTitle = firstSong?.getTitle(), let secondTitle = secondSong?.getTitle() else {
            return "Unknown percentage"
        }
        return "The matching percentage between \(firstTitle) and \(secondTitle) is: \(matchingPoints)%\n"
    }
    
    func getGenreMatching() -> Double {
        let genres = [
            "Pop": ["Dance-Pop", "Pop-Rock", "Indie-Pop", "Electropop"],
            "Dance-Pop": ["Pop", "Electropop", "Disco"],
            "Pop-Rock": ["Pop", "Rock", "Indie-Pop"],
            "Electropop": ["Pop", "Dance-Pop", "Industrial Rock"],
            "Indie-Pop": ["Pop", "Pop-Rock", "Indie"],
            "Britpop": ["Pop", "Rock", "Indie"],
            "Rock": ["Pop-Rock", "Indie Rock", "Alternative Rock"],
            "Indie Rock": ["Rock", "Alternative Rock", "Indie"],
            "Alternative Rock": ["Rock", "Indie Rock", "Industrial Rock"],
            "Industrial Rock": ["Alternative Rock", "Electropop"],
            "Indie": ["Indie Rock", "Indie-Pop", "Britpop"],
            "R&B": ["Soul", "Hip-Hop"],
            "Soul": ["R&B", "Disco"],
            "Hip-Hop": ["R&B", "Dance-Pop"],
            "Disco": ["Dance-Pop", "Soul"],
            "Soundtrack": ["Orchestral", "Pop", "Rock"]
        ]
        let firstGenre = firstSong?.basicInfo.genre ?? ""
        let secondGenre = secondSong?.basicInfo.genre ?? ""
        var matchingPoints = Double.zero
        
        guard firstGenre != secondGenre else {
            matchingPoints = 25
            return matchingPoints
        }
        
        genres.forEach {
            if $0.key == firstGenre && $0.value.contains(secondGenre) {
                matchingPoints = 17.5
            } else if $0.value.contains(firstGenre) && $0.value.contains(secondGenre) {
                matchingPoints = 10
            }
        }
        
        return matchingPoints
    }
    
    func getBPMMatching() -> Double {
        let subtractedBPM = abs((firstSong?.technicalInfo.bpm ?? Int.zero) - (secondSong?.technicalInfo.bpm ?? Int.zero))
        var matchingPoints = Double.zero
        
        switch subtractedBPM {
        case subtractedBPM where subtractedBPM < 10:
            matchingPoints = 20
        case subtractedBPM where 10...19 ~= subtractedBPM: // I found another way to simplify the contains keyword
            matchingPoints = 15
        case subtractedBPM where 20...29 ~= subtractedBPM:
            matchingPoints = 10
        case subtractedBPM where 30...39 ~= subtractedBPM:
            matchingPoints = 5
        default:
            return matchingPoints
        }
        
        return matchingPoints
    }
    
    func getTagsMatching() -> Double {
        var commonTags = Double.zero
        let maxTags: Double = 3
        let calculateMatchingPoints: (Double, Double) -> Double = { ($0 / $1) * 30 } // To practice with closures
        
        firstSong?.metadata.tags.forEach { tag in
            guard let tags = secondSong?.metadata.tags.contains(tag), tags else {
                return
            }
            commonTags = commonTags + 1
        }
        
        return calculateMatchingPoints(commonTags, maxTags)
    }
    
    func getTonalityMatching() -> Double {
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
        
        let firstKey = firstSong?.technicalInfo.key ?? ""
        let secondKey = secondSong?.technicalInfo.key ?? ""
        var matchingPoints = Double.zero
        
        guard firstKey != secondKey else {
            matchingPoints = 15
            return matchingPoints
        }
        
        tonalities.forEach {
            guard $0.key == firstKey && $0.value.contains(secondKey) else {
                return
            }
            matchingPoints = 10.5
        }
        
        return matchingPoints
    }
    
    func getPopularityMatching() -> Double {
        let subtractedPopularity = abs((firstSong?.metadata.popularity ?? Int.zero) - (secondSong?.metadata.popularity ?? Int.zero))
        let calculateMatchingPoints: (Int) -> Double = {
            10 * (1 - (Double($0) / 100))
        }
        
        return calculateMatchingPoints(subtractedPopularity)
    }
}
