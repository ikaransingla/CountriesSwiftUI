//
//  WebRepository.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 19/05/25.
//
import Foundation
import Combine

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {
    func call<Value: Decodable>(request: RequestBuilder,
                                queue: DispatchQueue = DispatchQueue(label: "bg")) -> AnyPublisher<Value, Error> {
        do {
            let request = try request.buildURLRequest(baseUrl: baseURL)
            return session.dataTaskPublisher(for: request)
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
        catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}

struct WebRepositoryImp: WebRepository {
    let session: URLSession
    let baseURL: String
}
