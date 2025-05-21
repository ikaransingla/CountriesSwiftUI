//
//  CountriesListContainer.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 20/05/25.
//

struct CountriesListContainer {
    let viewModel: CountriesListViewModel
    
    init(appContainer: AppContainer) {
        let webRepo: WebRepository = WebRepositoryImp(session: appContainer.session,
                                                      baseURL: appContainer.baseURL)
        let countryRepo: CountryRepository = CountryRepositoryImpl(webRepository: webRepo)
        self.viewModel = CountriesListViewModel(repo: countryRepo)
    }
}
