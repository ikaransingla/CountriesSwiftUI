//
//  Country+Mock.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 21/05/25.
//
@testable import CountriesSwiftUI

extension Country {
    static var mockList: [Country] {
        return [
            Country(name: Name(common: "Test1"),
                    cca2: "",
                    region: "Region1",
                    capital: ["Capital1"],
                    flags: Flags(png: "https://flagcdn.com/in.png")),
            Country(name: Name(common: "Test2"),
                    cca2: "",
                    region: "Region2",
                    capital: ["Capital2"],
                    flags: Flags(png: "https://flagcdn.com/fr.png")),
            Country(name: Name(common: "Test3"),
                    cca2: "",
                    region: "Region3",
                    capital: ["Capital3"],
                    flags: Flags(png: "https://flagcdn.com/us.png"))
        ]
    }
}
