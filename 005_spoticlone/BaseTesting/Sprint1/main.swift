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
        // To run tests you must comment lines 20 and 21
        var spoticlonePlayer = Player()
        spoticlonePlayer.open()
    }
}
