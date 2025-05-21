//
//  AppState.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//

import Foundation
final class AppState: ObservableObject {
    
    @Published var routing: Routing = Routing()
    
    struct Routing {
        var showDetailsForCountryCode: String?
    }
}
