//
//  Element.swift
//  Elements
//
//  Created by Jabeen's MacBook on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementData: Codable {
    let elements: [Element]
}

struct Element: Codable {
    let name: String 
    let symbol: String
    let number: Int
    let atomic_mass: Double
    let melt: Double?
    let boil: Double?
    let discovered_by: String?
    
    var numThreeDigits: String {
        switch number {
        case 0...9:
            return "00\(number)"
        case 10...99:
            return "0\(number)"
        default:
            return "\(number)"
        }
    }
  
}
