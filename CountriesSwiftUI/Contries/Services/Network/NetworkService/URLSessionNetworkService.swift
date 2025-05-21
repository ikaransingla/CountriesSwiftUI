//
//  URLSessionNetworkService.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//
import Foundation
import Combine

class URLSessionNetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    private let queue: DispatchQueue
    
    init(session: URLSession = .shared, queue: DispatchQueue = DispatchQueue(label: "background")) {
        self.session = session
        self.queue = queue
    }
    
    func execute<Value: Decodable>(request: URLRequest) -> AnyPublisher<Value, any Error> {
        session.dataTaskPublisher(for: request)
            .subscribe(on: queue)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: Value.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
