//
//  Coutries.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//

import Foundation

struct Country: Identifiable, Codable, Equatable {
    var id: UUID = UUID() // Unique identifier for SwiftUI
    let name: Name
    let cca2: String   // 2-letter country code
    let region: String
    let capital: [String]?
    let flags: Flags

    struct Name: Codable, Equatable {
        let common: String
    }

    struct Flags: Codable, Equatable {
        let png: String
    }

}

