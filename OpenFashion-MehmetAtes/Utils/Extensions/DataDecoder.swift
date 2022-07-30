//
//  DataDecoder.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.07.2022.
//

import Foundation

extension Data {
    
    /// Decode any data to any Codable struct or class when they matched
    func decode<T: Codable>() -> T? {
        try? JSONDecoder().decode(T.self, from: self)
    }
}
