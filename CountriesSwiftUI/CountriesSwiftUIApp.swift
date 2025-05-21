//
//  CountriesSwiftUIApp.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 14/05/25.
//

import SwiftUI

@main
struct CountriesSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let appDI = AppContainer()
            let countries = CountriesListContainer(appContainer: appDI)
            CountriesListView(viewModel: countries.viewModel)
        }
    }
}
