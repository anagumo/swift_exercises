//
//  SongsLoader.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

class SongsLoader {
    
    // MARK: Properties
    let logger: Logger
    var songs: [Song]
    
    
    // MARK: Init
    init(fromData testData: Data? = nil) {
        // Inicializamos las variables (para eso está el init)
        self.songs = []
        self.logger = Logger(subsystem: "Sprint1", category: "SongsLoader")
        
        // Cargamos las canciones del JSON y tratamos el error imprimiéndolo por pantalla
        guard let loadedSongs = loadSongs(fromData: testData) else {
            logger.info("Unable to load songs in the initializer of SongsLoader")
            return
        }
        // Si se han podido cargar las canciones, las tenemos en SongsLoader
        self.songs = loadedSongs
    }
    
    // MARK: Functions
    private func loadSongs(fromData testData: Data? = nil) -> [Song]? {
        
        // Si se ha pasado un data desde los tests, lo usamos, si no, cargamos el JSON del bundle
        let data: Data
        
        do {
            if let testData {
                
                data = testData
                
            } else {
                guard let filepath =  Bundle.main.path(forResource: "songs", ofType: "json", inDirectory: "Datasource/songs") else {
                    print("Error: No se encontró el archivo songs.json en el bundle.")
                    return nil
                }
                let url = URL(fileURLWithPath: filepath)
                
                guard FileManager.default.fileExists(atPath: url.path) else {
                    print("Error: No se encontró el archivo songs.json en la ruta.")
                    return nil
                }
                
                data = try Data(contentsOf: url)
            }
              
        let decoder = JSONDecoder()
        
        // Configurar el DateFormatter
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let songsResponse = try decoder.decode(SongsResponse.self, from: data)
        return songsResponse.songs
            
        } catch {
            print("Error al cargar o decodificar songs.json: \(error)")
            return nil
        }
    }
    
    // MARK: - Search and filter
    func filterByArtist(_ artist: String) -> [Song] {
        songs.filter { $0.isBy(artist: artist) }
    }
    
    func filterByDuration(minutes: Int) -> [Song] {
        songs.filter { $0.isGreaterThan(minutes: minutes) }
    }
    
    // MARK: - "Calculations and Statistics"
    func getTotalDuration() -> Double {
        songs.reduce(0, { $0 + $1.toMinutes() })
    }
    
    func getAlbumWithMoreSongs() -> (String, Int)? {
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
    
    // MARK: - "Complex validations"
    func validateTonalities() -> Set<String> {
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
        
        return Set(tonalities.keys).subtracting(songs.map { $0.technicalInfo.key })
    }
    
    // MARK: Playlist
    func getCount() -> Int {
        songs.count
    }
    
    func orderByPopularity() -> [Song] {
        songs.sorted {
            $0.metadata.popularity > $1.metadata.popularity
        }
    }
    
    func orderByDescending() -> [Song] {
        songs.reversed()
    }
    
    // MARK: DJ Styles
    func filterBy(tag: String) -> [Song] {
        songs.filter { song in
            song.metadata.tags.contains(tag)
        }
    }
    
    func filterBy(tags: Set<String>) -> [Song] {
        songs.filter { song in
            song.metadata.tags.contains { tag in
                tags.contains(tag)
            }
        }
    }
}
