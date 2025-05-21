//
//  Loadable.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 18/05/25.
//

enum Loadable<T> {
    case notRequested
    case loading(last: T?)
    case loaded(T)
    case error(Error)
    
    var value: T? {
        switch self {
        case .notRequested:
            return nil
        case .loading(let T):
            return T
        case .loaded(let T):
            return T
        default:
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .error(let err):
            return err
        default:
            return nil
        }
    }
}
