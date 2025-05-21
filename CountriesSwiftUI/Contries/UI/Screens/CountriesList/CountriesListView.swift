//
//  CountriesListView.swift
//  CountriesSwiftUI
//
//  Created by Karan Singla on 20/05/25.
//
import SwiftUI

struct CountriesListView: View {
    @ObservedObject var viewModel: CountriesListViewModel
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Countries")
                .onAppear {
                    if case .notRequested = viewModel.countries {
                        viewModel.loadCountries()
                    }
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.countries {
        case .notRequested:
            ProgressView("Loading...")
        case .loading(let last):
            if let last {
                countriesList(countries: last)
                    .overlay(ProgressView(), alignment: .center)
            } else {
                ProgressView("Loading...")
            }
        case .loaded(let t):
            countriesList(countries: t)
        case .error(let error):
            VStack {
                Text("Failed to load countries")
                Text(error.localizedDescription)
                Button("Retry") {
                    viewModel.loadCountries()
                }
            }
        }
    }
    
    private func countriesList(countries: [Country]) -> some View {
        List(countries) { country in
            
            HStack {
                AsyncImage(url: URL(string: country.flags.png)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 32, height: 20)
                Text(country.name.common)

            }
        }
    }
}
