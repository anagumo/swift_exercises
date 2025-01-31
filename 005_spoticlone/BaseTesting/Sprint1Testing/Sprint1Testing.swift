//
//  Sprint1Testing.swift
//  Sprint1Testing
//
//  Created by Ismael Sabri Pérez on 20/1/25.
//

import Testing

class Sprint1Testing {
    @Test func getSongsFromArtist() async throws {
        let testData = TestData.getFiveSongs() ?? "".data(using: .utf8)!
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getSongsFromArtist("The Weeknd", inSongs: songs).count == 1, "Se espera que al menos haya una canción de The Weeknd")
    }
    
    @Test func getSongsFromArtistWithEmptySong() async throws {
        #expect(Main().getSongsFromArtist("The Weeknd", inSongs: []).count == 0, "Se espera un array de canciones vacías para The Weeknd porque no hemos pasado ninguna canción en la función")
    }
}
