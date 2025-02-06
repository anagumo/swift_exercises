import Testing
import Foundation

class Sprint1Testing {
    
    @Suite("Search and filter")
    class SearchAndFilterTests {
        var testData: Data?
        var songsLoader: SongsLoader?
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songsLoader = SongsLoader(fromData: testData)
        }
        
        deinit {
            testData = nil
            songsLoader = nil
        }
        
        @Test func filterByArtist() async throws {
            #expect(songsLoader?.filterByArtist("Justin Bieber").count == 1,
                    "Se espera que al menos haya una canción de Justin Bieber")
        }
        
        @Test func filterByDuration() async throws {
            #expect(songsLoader?.filterByDuration(minutes: 3).count == 6,
                    "Se espera que todas las canciones duren más de 3 minutos")
        }
    }
    
    @Suite("Calculations and Statistics")
    class CalculationAndTests {
        var testData: Data?
        var songsLoader: SongsLoader?
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songsLoader = SongsLoader(fromData: testData)
        }
        
        deinit {
            testData = nil
            songsLoader = nil
        }
        
        @Test func getTotalDuration() async throws {
            #expect(songsLoader?.getTotalDuration() ?? 0 > 17,
                    "Se espera que el total de duración sea mayor que 17 minutos")
        }
        
        @Test func getAlbumWithMoreSongs() async throws {
            #expect(songsLoader?.getAlbumWithMoreSongs() ?? ("", 0) == ("Future Nostalgia", 2),
                    "Se espera que el album con más canciones sea de Dua Lipa")
        }
    }
    
    @Suite("Complex validations")
    class ComplexValidationsTests {
        var testData: Data?
        var songsLoader: SongsLoader?
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songsLoader = SongsLoader(fromData: testData)
        }
        
        deinit {
            testData = nil
            songsLoader = nil
        }
        
        @Test func validateTonalities() async throws {
            #expect(songsLoader?.validateTonalities().count == 13,
                    "Se espera que arroje 13 tonalidades faltantes: C#, Db, D#, Eb, E, F, Gb, G, G#, Ab, A#, Bb, B")
        }
    }
    
    @Suite("Playlist")
    class PlaylistTests {
        var testData: Data?
        var songsLoader: SongsLoader?
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songsLoader = SongsLoader(fromData: testData)
        }
        
        deinit {
            testData = nil
            songsLoader = nil
        }
        
        @Test func getSongsCount() async throws {
            #expect(songsLoader?.getCount() == 6, "Se espera que haya 6 canciones")
        }
        
        @Test func orderSongsByPopularity() async throws {
            let firstSong = songsLoader?.orderByPopularity().first?.getTitle()
            #expect(firstSong == "Peaches", "Se espera que la canción más popular sea de Justin Biber")
        }
        
        @Test func orderSongsByDescending() async throws {
            let firstSong = songsLoader?.orderByDescending().first?.getTitle()
            #expect(firstSong == "Untitled", "Se espera que la canción sea la última de la lista en orden ascendente")
        }
        
        @Test func orderSongsByTonality() async throws {
            let firstTonality = songsLoader?.orderByTonality().first?.getTitle()
            #expect(firstTonality == "Industry Baby", "Se espera que la canción con la tonalidad más alta sea de Lil Nas X")
        }
    }
    
    @Suite("DJ Styles")
    class DJConfigurationTests {
        var testData: Data?
        var songsLoader: SongsLoader?
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            songsLoader = SongsLoader(fromData: testData)
        }
        
        deinit {
            testData = nil
            songsLoader = nil
        }
        
        @Test func filterSongsByTag() async throws {
            #expect(songsLoader?.filterBy(tag: "dance").count == 3,
                    "Se espera que tengamos 3 canciones con este género musical")
        }
        
        @Test func filterSongsByTags() async throws {
            #expect(songsLoader?.filterBy(tags: Set(["disco", "dance", "summer"])).count == 4,
                    "Se espera que tengamos 4 canciones con ese estilo de DJ")
        }
    }
    
    @Suite("Discover Music")
    class DiscoverMusic {
        var testData: Data?
        var firstSong: Song?
        var secondSong: Song?
        var discoverTasks: DiscoverTasks = Discover() // I set the protocol to know what happen
        
        init() {
            testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
            firstSong = SongsLoader(fromData: testData).songs.first
            secondSong = SongsLoader(fromData: testData).songs.last
        }
        
        deinit {
            testData = nil
            firstSong = nil
            secondSong = nil
        }
        
        @Test func getGenreMatching() async throws {
            #expect(discoverTasks.getGenreMatching(firstSong, secondSong) == 25,
                    "Se espera que el matching entre Blinding Lights y Untitled sea de 25 puntos")
        }
        
        @Test func getBPMMatching() async throws {
            #expect(discoverTasks.getBPMMatching(firstSong, secondSong) == 0,
                    "Se espera que el matching de bpm entre Blinding Lights y Untitled sea de 0 puntos")
        }
        
        @Test func getTagsMatching() async throws {
            #expect(discoverTasks.getTagsMatching(firstSong, secondSong) == 10,
                    "Se espera que el matching de tags entre Blinding Lights y Untitled sea de 10 puntos")
        }
        
        @Test func getTonalityMatching() async throws {
            #expect(discoverTasks.getTonalityMatching(firstSong, secondSong) == 0,
                    "Se espera que el matching de tonalidades entre Blinding Lights y Untitled sea de 0 puntos")
        }
        
        @Test func getPopularityMatching() async throws {
            #expect(discoverTasks.getPopularityMatching(firstSong, secondSong) == 9.5,
                    "Se espera que el matching de popularidad entre Blinding Lights y Untitled sea de 9.5 puntos")
        }
        
        @Test func getTotalMatching() async throws {
            #expect(discoverTasks.calculateMatchingPoints(firstSong, secondSong) == 44.5,
                    "De acuerdo a la suma de los puntos anteriores se espera que el match de ambas canciones sea del 44.5%")
        }
    }
}
