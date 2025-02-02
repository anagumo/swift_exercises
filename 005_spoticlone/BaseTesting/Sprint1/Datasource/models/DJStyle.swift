//
//  Style.swift
//  Sprint1
//
//  Created by Ariana Rodríguez on 02/02/25.
//

import Foundation

enum StyleType: String {
    case chillVibes = "DJ Chill Vibes"
    case partyStarter = "DJ Party Starter"
    case rockAnthems = "DJ Rock Anthems"
    case emotionalTrip = "DJ Emotional Trip"
    case energyBoost = "DJ Energy Boost"
    case eightyLovers = "DJ Eighty Lovers"
    
    var description: String {
        var description = ""
        switch self {
        case .chillVibes:
            description = "Canciones relajantes y suaves para crear un ambiente tranquilo"
        case .partyStarter:
            description = "Centrado en levantar el ánimo y sacar a la gente a bailar"
        case .rockAnthems:
            description = "Ideal para apasionados del rock y el heavy, tanto clásico como moderno"
        case .emotionalTrip:
            description = "Diseñado para conectar emocionalmente con la audiencia. Canciones con mensajes profundos y melancólicos"
        case .energyBoost:
            description = "Perfecto para motivar y energizar a una multitud sin importar la hora del día"
        case .eightyLovers:
            description = "Para aquellos amantes del synth, el pop retro y la nostalgia de los años 80"
        }
        return description
    }
}

struct DJStyle: StyleUpdatable {
    let type: StyleType
    let description: String
    var tags: Set<String>
    
    mutating func add(tag: String) {
        tags.insert(tag)
    }
}
