//
//  SearchViewModel.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 4.08.2022.
//

import Alamofire

protocol SearchViewModel { }

// swiftlint: disable all
extension SearchViewModel {
    
    func getSearch(_ key: String) {
        
    }
}

struct SearchProduct: Codable {
    let images: [String: String]
}
