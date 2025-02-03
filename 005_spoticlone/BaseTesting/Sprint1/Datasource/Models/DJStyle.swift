//
//  Style.swift
//  Sprint1
//
//  Created by Ariana Rodríguez on 02/02/25.
//

import Foundation

enum StyleType: String {
    case Custom = "Custom"
    case ChillVibes = "DJ Chill Vibes"
    case PartyStarter = "DJ Party Starter"
    case RockAnthems = "DJ Rock Anthems"
    case EmotionalTrip = "DJ Emotional Trip"
    case EnergyBoost = "DJ Energy Boost"
    case EightyLovers = "DJ Eighty Lovers"
    case Invalid
    
    init?(input: Int) {
        switch input {
        case 0:
            self = .Custom
        case 1:
            self = .ChillVibes
        case 2:
            self = .PartyStarter
        case 3:
            self = .RockAnthems
        case 4:
            self = .EmotionalTrip
        case 5:
            self = .EnergyBoost
        case 6:
            self = .EightyLovers
        default:
            self = .Invalid
        }
    }
    
    var description: String {
        var description = ""
        switch self {
        case .Custom:
            description = "Creación personalizada basada en tags seleccionados por un gran DJ"
        case .ChillVibes:
            description = "Canciones relajantes y suaves para crear un ambiente tranquilo"
        case .PartyStarter:
            description = "Centrado en levantar el ánimo y sacar a la gente a bailar"
        case .RockAnthems:
            description = "Ideal para apasionados del rock y el heavy, tanto clásico como moderno"
        case .EmotionalTrip:
            description = "Diseñado para conectar emocionalmente con la audiencia. Canciones con mensajes profundos y melancólicos"
        case .EnergyBoost:
            description = "Perfecto para motivar y energizar a una multitud sin importar la hora del día"
        case .EightyLovers:
            description = "Para aquellos amantes del synth, el pop retro y la nostalgia de los años 80"
        case .Invalid:
            description = ""
        }
        
        return description
    }
    
    var tags: Set<String> {
        var tags = Set<String>()
        switch self {
        case .ChillVibes:
            tags = ["chill", "soulful", "acoustic", "memories", "soft rock", "nostalgic", "peace"]
        case .PartyStarter:
            tags = ["party", "dance", "energetic", "disco", "summer", "fun", "uplifting", "catchy"]
        case .RockAnthems:
            tags = ["rock", "hard rock", "power ballad", "anthem", "epic", "alternative", "angry"]
        case .EmotionalTrip:
            tags = ["emotional", "heartbreak", "melancholic", "regret", "nostalgia", "reflective", "romantic"]
        case .EnergyBoost:
            tags = ["motivational", "inspiration", "freedom", "empowerment", "upbeat", "heroic", "power"]
        case .EightyLovers:
            tags = ["80s", "synthwave", "pop", "iconic", "retro"]
        default:
            tags = []
        }
        
        return tags
    }
}

struct DJStyle {
    let name: String
    let type: StyleType
    var tags: Set<String>
    
    mutating func addTags(_ tags: Set<String> = []) {
        guard type == .Custom else {
            return
        }
        
        self.tags = tags
    }
}
