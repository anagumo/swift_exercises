//
//  Sprint1Testing.swift
//  Sprint1Testing
//
//  Created by Ismael Sabri Pérez on 20/1/25.
//

import Testing

class Sprint1Testing {
    
    let testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
    
    @Test func filterByArtist() async throws {
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().filterByArtist("Justin Bieber", songs: songs).count == 1,
                "Se espera que al menos haya una canción de Justin Bieber")
    }
    
    @Test func filterByDuration() async throws {
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().filterByDuration(minutes: 3, songs: songs).count == 6,
                "Se espera que todas las canciones duren más de 3 minutos")
    }
    
    @Test func getTotalDuration() async throws {
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getTotalDuration(songs: songs) > 17,
                "Se espera que el total de duración sea mayor que 17 minutos")
    }
    
    @Test func getAlbumWithMoreSongs() async throws {
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getAlbumWithMoreSongs(songs: songs) ?? ("", 0) == ("Future Nostalgia", 2),
                "Se espera que el album con más canciones sea de Dua Lipa")
    }
    
    @Test func validateTonalities() async throws {
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().validateTonalities(songs: songs).count == 13,
                "Se espera que arroje 13 tonalidades faltantes: C#, Db, D#, Eb, E, F, Gb, G, G#, Ab, A#, Bb, B")
    }
}
