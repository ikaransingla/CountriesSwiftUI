//
//  DIContainer.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 16/05/25.
//
import Foundation

struct AppContainer {
    let appState: Store<AppState>
    let session: URLSession
    let baseURL: String
    
    init() {
        self.appState = Store(value: AppState())
        self.session = .shared
        self.baseURL = "https://restcountries.com"
    }
    
}
