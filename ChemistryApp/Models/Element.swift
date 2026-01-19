//
//  Element.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct Element: Identifiable, Codable {
    let id: Int // Atomic number
    let symbol: String
    let name: String
    let atomicMass: Double
    let category: ElementCategory
    let group: Int
    let period: Int
    let electronConfiguration: String
    let electronegativity: Double?
    let density: Double?
    let meltingPoint: Double?
    let boilingPoint: Double?
    let discoveredBy: String?
    let yearDiscovered: Int?
    let description: String
    
    var atomicNumber: Int { id }
}

enum ElementCategory: String, Codable, CaseIterable {
    case alkaliMetal = "Alkali Metal"
    case alkalineEarthMetal = "Alkaline Earth Metal"
    case transitionMetal = "Transition Metal"
    case postTransitionMetal = "Post-Transition Metal"
    case metalloid = "Metalloid"
    case reactiveNonmetal = "Reactive Nonmetal"
    case nobleGas = "Noble Gas"
    case lanthanide = "Lanthanide"
    case actinide = "Actinide"
    case unknown = "Unknown"
    
    var color: Color {
        switch self {
        case .alkaliMetal:
            return Color(red: 1.0, green: 0.4, blue: 0.4)
        case .alkalineEarthMetal:
            return Color(red: 1.0, green: 0.6, blue: 0.3)
        case .transitionMetal:
            return Color(red: 1.0, green: 0.8, blue: 0.4)
        case .postTransitionMetal:
            return Color(red: 0.6, green: 0.8, blue: 0.6)
        case .metalloid:
            return Color(red: 0.4, green: 0.8, blue: 0.8)
        case .reactiveNonmetal:
            return Color(red: 0.4, green: 0.6, blue: 1.0)
        case .nobleGas:
            return Color(red: 0.7, green: 0.5, blue: 0.9)
        case .lanthanide:
            return Color(red: 1.0, green: 0.7, blue: 0.8)
        case .actinide:
            return Color(red: 0.9, green: 0.6, blue: 0.7)
        case .unknown:
            return Color.gray
        }
    }
}
