//
//  CountryRepo.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 19/05/25.
//
import Combine

protocol CountryRepository {
    func fetchAllCountries() -> AnyPublisher<[Country], Error>
}

final class CountryRepositoryImpl: CountryRepository {
    private let webRepository: WebRepository
    
    init(webRepository: WebRepository) {
        self.webRepository = webRepository
    }
    
    func fetchAllCountries() -> AnyPublisher<[Country], any Error> {
        let requestBuilder: RequestBuilder = .init(
            path: "/v3.1/all",
            method: "GET"
            , headers: [:])
        return webRepository.call(request: requestBuilder)
    }
}
