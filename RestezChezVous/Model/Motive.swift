//
//  Motive.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import Foundation

enum Motive: String {
    
    case professional
    case groceryShopping
    case health
    case assistance
    case exercise
    
}

extension Motive {
    
    var title: String {
        return motiveTitle()
    }
    var description: String {
        return motiveDescription()
    }
    
    func motiveTitle() -> String {
        
        switch self {
        case .professional:
            return "Professionnel"
        case .groceryShopping:
            return "Achats de première nécessité"
        case .health:
            return "Motif de santé"
        case .assistance:
            return "Motif familial impérieux ou assistance"
        case .exercise:
            return "Déplacements brefs"
        }
    }
    
    func motiveDescription() -> String {
        
        switch self {
        case .professional:
            return "Déplacements entre le domicile et le lieu d’exercice de l’activité professionnelle, lorsqu’ils sont indispensables à l’exercice d’activités ne pouvant être organisées sous forme de télétravail (sur justificatif permanent) ou déplacements professionnels ne pouvant être différés"
        case .groceryShopping:
            return "Déplacements pour effectuer des achats de première nécessité dans des établissements autorisés (liste sur gouvernement.fr)"
        case .health:
            return "Déplacements pour motif de santé"
        case .assistance:
            return "Déplacements pour motif familial impérieux, pour l’assistance aux personnes vulnérables ou la garde d’enfants"
        case .exercise:
            return "Déplacements brefs, à proximité du domicile, liés à l’activité physique individuelle des personnes, à l’exclusion de toute pratique sportive collective, et aux besoins des animaux de compagnie"
        }
    }
}


