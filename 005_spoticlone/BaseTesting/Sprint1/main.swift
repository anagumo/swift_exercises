//
//  main.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

Main().main() // Ejecutamos el programa

class Main {
    
    let logger = Logger(subsystem: "Sprint1", category: "main")

    // MARK: - Main
    func main() {
        
        let songs = SongsLoader().songs

        for song in songs {
            print(song.basicInfo.title)
        }
        
    }

    // MARK: - Búsquedas y filtrados básicos
    func getSongsFromArtist(_ artist: String, inSongs songs: [Song]) -> [Song] {
        // Registramos el inicio de la operación
        logger.info("Iniciando búsqueda de canciones del artista: \(artist)")
        
        guard !songs.isEmpty else {
            logger.warning("La lista de canciones está vacía")
            return []
        }
        
        // Convertimos el artista a minúsculas para hacer la búsqueda insensible a mayúsculas
        let normalizedArtist = artist.lowercased()
        
        // Filtramos las canciones por artista
        let matchingSongs = songs.filter { $0.basicInfo.artist.lowercased() == normalizedArtist }
        
        logger.debug("Proceso de filtrado completado. Canciones encontradas: \(matchingSongs.count)")
        
        // Comprobamos si se han encontrado canciones, si no, lo indicamos
        guard !matchingSongs.isEmpty else {
            logger.warning("No se han encontrado canciones de \(artist) en la función \(#function)")
            return []
        }
        
        // Devolvemos el array de canciones
        return matchingSongs
    }
}



