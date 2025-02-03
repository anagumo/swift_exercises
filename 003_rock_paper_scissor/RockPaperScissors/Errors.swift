//
//  Errors.swift
//  RockPaperScissors
//
//  Created by Ariana Rodríguez on 03/02/25.
//

import Foundation

enum GameError: Error {
    case EmptyMenu
    case InvalidOption
    case Unknown
    
    var errorMessage: String {
        var errorMessage = ""
        switch self {
        case .EmptyMenu:
            errorMessage = "\nEl menú requiere opciones para interactuar con el usuario"
        case .InvalidOption:
            errorMessage = "\nOpción inválida, selecciona una opción de la lista ej: 0\n"
        case .Unknown:
            errorMessage = "\nOcurrió un error desconocido"
        }
        
        return errorMessage
    }
}
