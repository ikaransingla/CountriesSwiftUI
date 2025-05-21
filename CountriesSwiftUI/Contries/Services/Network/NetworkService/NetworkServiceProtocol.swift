//
//  NetworkServiceProtocol.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//
import Combine
import Foundation

protocol NetworkServiceProtocol {
    func execute<Value: Decodable>(request: URLRequest) -> AnyPublisher<Value, Error>
}
