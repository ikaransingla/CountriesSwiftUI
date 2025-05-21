//
//  CustomWebRespository.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 19/05/25.
//
import Combine

protocol CustomWebRespository {
    var networkService: NetworkServiceProtocol { get }
    var baseURL: String { get }
}

extension CustomWebRespository {
    
    func call<Value: Decodable>(_ baseURL: String, request: RequestBuilder) -> AnyPublisher<Value, Error> {
        do {
            let request = try request.buildURLRequest(baseUrl: baseURL)
            return networkService.execute(request: request)
        }
        catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
}

struct CustomWebRespositoryImp: CustomWebRespository {
    var networkService: NetworkServiceProtocol
    var baseURL: String
}
