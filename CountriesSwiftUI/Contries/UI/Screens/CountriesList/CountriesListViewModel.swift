//
//  CountriesListViewModel.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 20/05/25.
//
import SwiftUI
import Combine

class CountriesListViewModel: ObservableObject {
    
    @Published var countries: Loadable<[Country]> = .notRequested
    
    private let repo: CountryRepository
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(repo: CountryRepository) {
        self.repo = repo
    }
    
    func loadCountries() {
        self.repo.fetchAllCountries()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.countries = .error(error)
                }
            } receiveValue: { countries in
                self.countries = .loaded(countries)
            }
            .store(in: &cancellables)
    }
        
    
}

