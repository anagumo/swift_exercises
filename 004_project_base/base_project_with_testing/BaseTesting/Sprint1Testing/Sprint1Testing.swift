//
//  Sprint1Testing.swift
//  Sprint1Testing
//
//  Created by Ismael Sabri Pérez on 20/1/25.
//

import Testing
import Foundation

// Swift Testing
class Sprint1Testing {
    
    @Suite("Search and filter")
    // Use class vs struct to set require instances in the init
    class SearchAndFilterTests {
        var testData: Data?
        var songs: [Song]
        var mainInstance = Main()
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songs = SongsLoader(fromData: testData).songs
        }
        
        deinit {
            testData = nil
            songs = []
        }
        
        @Test func filterByArtist() async throws {
            let songs = SongsLoader(fromData: testData).songs
            #expect(mainInstance.filterByArtist("Justin Bieber", songs: songs).count == 1,
                    "Se espera que al menos haya una canción de Justin Bieber")
        }
        
        @Test func filterByDuration() async throws {
            #expect(mainInstance.filterByDuration(minutes: 3, songs: songs).count == 6,
                    "Se espera que todas las canciones duren más de 3 minutos")
        }
    }
    
    @Suite("Calculations and Statistics")
    class CalculationAndTests {
        var testData: Data?
        var songs: [Song]
        var mainInstance = Main()
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songs = SongsLoader(fromData: testData).songs
        }
        
        deinit {
            testData = nil
            songs = []
        }
        
        @Test func getTotalDuration() async throws {
            #expect(mainInstance.getTotalDuration(songs: songs) > 17,
                    "Se espera que el total de duración sea mayor que 17 minutos")
        }
        
        @Test func getAlbumWithMoreSongs() async throws {
            #expect(mainInstance.getAlbumWithMoreSongs(songs: songs) ?? ("", 0) == ("Future Nostalgia", 2),
                    "Se espera que el album con más canciones sea de Dua Lipa")
        }
    }
    
    @Suite("Complex validations")
    class ComplexValidationsTests {
        var testData: Data?
        var songs: [Song]
        var mainInstance = Main()
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songs = SongsLoader(fromData: testData).songs
        }
        
        deinit {
            testData = nil
            songs = []
        }
        
        @Test func validateTonalities() async throws {
            #expect(mainInstance.validateTonalities(songs: songs).count == 13,
                    "Se espera que arroje 13 tonalidades faltantes: C#, Db, D#, Eb, E, F, Gb, G, G#, Ab, A#, Bb, B")
        }
    }
}
