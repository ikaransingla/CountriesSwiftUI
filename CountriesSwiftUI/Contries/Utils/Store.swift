//
//  Store.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//

import Foundation

class Store<Value>: ObservableObject {
    @Published var value: Value
    
    init(value: Value) {
        self.value = value
    }
}
