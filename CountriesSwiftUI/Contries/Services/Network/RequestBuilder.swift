//
//  RequestBuilder.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//

import Foundation

struct RequestBuilder {
    
    var path: String
    var method: String
    var headers: [String: String]
    
    init(path: String, method: String, headers: [String: String]) {
        self.path = path
        self.method = method
        self.headers = headers
    }
    
    func buildURLRequest(baseUrl: String) throws -> URLRequest {
        guard let url = URL(string: baseUrl + path) else {
            throw APIError.invalidUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        return urlRequest
    }
    
}
